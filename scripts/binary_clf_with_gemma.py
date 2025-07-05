import torch
import torch.nn.functional as F
from transformers import AutoProcessor, Gemma3ForConditionalGeneration

from PIL import Image
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

image = Image.open("/home/mh3897/pddl/villain/data/blocksworld/observations/problem2.jpg")
prompts = [
    "In the image, is pink block on purple block? (Answer only yes/no)", # yes
    "In the image, is blue block on purple block? (Answer only yes/no)", # no
    "In the image, is red block on purple block? (Answer only yes/no)", # no
    "In the image, is purple block on blue block? (Answer only yes/no)", # no
    "In the image, is there a block on purple block? (Answer only yes/no)", # yes
]

# TODO: 1. single step decoding for true/false, 2. patch for img_embeds, 3. prefix common prompt, 4. cot

# Prepare prompts and image
template = (
    "<bos><start_of_turn>user\n"
    "<start_of_image>\n{prompt}"
    "<end_of_turn><eos>\n"
    "<start_of_turn>model\n"
)
full_prompts = [template.format(prompt=prompt) for prompt in prompts]
batch = processor(
    images=[[image] for _ in prompts],  # preprocess image and text jointly to trigger <im_patch> tokens
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

# Precompute image embeddings
with torch.no_grad():
    vision_out = model.vision_tower(batch["pixel_values"][:1])
    patch_embeds = vision_out.last_hidden_state
    img_embeds = model.multi_modal_projector(patch_embeds)  # Compute image on time
img_embeds = img_embeds.expand(len(prompts), -1, -1)  # Broadcast to batch size

del batch["pixel_values"]

start_time = time.time()

max_new_tokens = 64

with torch.no_grad():
    outputs = model(
        input_ids=batch["input_ids"],
        attention_mask=batch["attention_mask"],
        image_embeds=img_embeds,
        use_cache=True,
    )
logits = outputs.logits[:, -1] # (batch_size, vocab_size)

probs = F.softmax(logits[:, candidate], dim=-1) # (batch_size, 2)
pred = torch.argmax(probs, dim=-1)

torch.cuda.synchronize()
end_time = time.time()
print("pred (yes) = ", probs[:, 0])
print("pred (no) = ", probs[:, 1])
print(f"Time taken: {end_time - start_time} seconds")
