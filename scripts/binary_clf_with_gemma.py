import torch
import torch.nn.functional as F
from transformers import AutoProcessor, Gemma3ForConditionalGeneration

from PIL import Image
import hashlib
import time

torch.cuda.empty_cache()

model_id = "google/gemma-3-12b-it"
processor = AutoProcessor.from_pretrained(model_id, padding_side="left")

torch.set_float32_matmul_precision('high')

model = Gemma3ForConditionalGeneration.from_pretrained(
    model_id,
    torch_dtype=torch.bfloat16,
    device_map="auto",
    attn_implementation='sdpa',
)
print(f"Model device: {model.device}")
# model = torch.compile(model, mode="reduce-overhead")

# monkey patch
cache = {}
old_get_img_feat = model.get_image_features

def cached_get_img_feat(pixel_values):  # (batch_size, num_channels, height, width)
    outs = []
    for row in pixel_values:
        key = hashlib.sha1(row.float().cpu().numpy().tobytes()).hexdigest()
        if key not in cache:
            with torch.no_grad():
                cache[key] = old_get_img_feat(row.unsqueeze(0))
        outs.append(cache[key])
    return torch.cat(outs, dim=0)

model.get_image_features = cached_get_img_feat

image = Image.open("/home/mh3897/pddl/villain/data/blocksworld/observations/problem4.jpg")
prompts = [
    "Is purple block on top of red block? (Answer only yes/no)", # yes
    "Is red block on top of purple block? (Answer only yes/no)", # no
    "Is yellow block to the right of blue block? (Answer only yes/no)", # yes
    "Is yellow block to the left of blue block? (Answer only yes/no)", # no
    "Is there an orange block? (Answer only yes/no)", # yes
    "Is orange block on top of blue block? (Answer only yes/no)", # no
]

# Prepare prompts and image
chat_prompts = []
for prompt in prompts:
    messages = [
        {
            "role": "user",
            "content": [
                {"type": "image", "image": image},
                {"type": "text", "text": prompt}
            ]
        },
        {
            "role": "assistant",
            "content": [
                {"type": "text", "text": "Based on the image, the answer is: Yes."}
            ]
        },
        {
            "role": "user",
            "content": [
                {"type": "text", "text": "Check again."}
            ]
        }
    ]
    chat_prompt = processor.apply_chat_template(
        messages,
        return_tensors="pt",
        padding=True,
        add_generation_prompt=True,
    )
    chat_prompts.append(chat_prompt)

template = "{chat_prompt} You are right to ask me to double-check! My apologies. Looking again, the answer is: "
full_prompts = [template.format(chat_prompt=chat_prompt) for chat_prompt in chat_prompts]
print(full_prompts[0])

batch = processor(
    images=[[image] for _ in prompts],  # preprocess image and text jointly to trigger <image_soft_tokens>
    text=full_prompts,
    return_tensors="pt",
    padding=True,
    images_kwargs={"do_pan_and_scan": False},  # disable cropping
).to(model.device, dtype=torch.bfloat16)

# Prepare binary classes
true_tok = processor.tokenizer.convert_tokens_to_ids("yes") # 11262
false_tok = processor.tokenizer.convert_tokens_to_ids("no") # 951
assert true_tok != processor.tokenizer.unk_token_id  # unknown token is 3
assert false_tok != processor.tokenizer.unk_token_id
candidate = torch.tensor([true_tok, false_tok], device=model.device)

start_time = time.time()
temperature = 0.5
with torch.no_grad():
    logits = model(**batch).logits[:, -1]
probs = F.softmax(logits[:, candidate] / temperature, dim=-1)

torch.cuda.synchronize()
end_time = time.time()
print("pred (yes) = ", probs[:, 0].float().cpu().numpy().round(2))
print("pred (no) = ", probs[:, 1].float().cpu().numpy().round(2))
print(f"Time taken: {end_time - start_time} seconds")

