# Baseline Methods Implementation Table


| Baseline | Function Name | Annotation |
|----------|---------------|------------|
| **VLLM zero-shot planning (ViLA)** | `generate_vila_planning` | Replicate prompt |
| **VLLM zero-shot PDDL (ViLain)** | `generate_villain_pddl` | Clone + install Dino / BLIP; If BLIP == VLLM, use VLLM; Review prompt (delete one-shot and other hacking methods) |
| **VLLM direct PDDL generation** | `generate_villain_direct_pddl` | prompt = "given image + instruction, write the problem file" |
| **VLLM captioning → PDDL** | `generate_villain_captioning_pddl` | Round 1 captioning → Round 2 PDDL; no bbox VLLM normalized coordinates |
| **VLLM captioning → PDDL + DINO** | `generate_villain_captioning_dino_pddl` | Round 1 captioning → Round 2 DINO → Round 3 PDDL; Enhanced with spatial verification |
| **VLLM scene graph → PDDL (no DINO)** | `generate_scene_graph_to_pddl` | Two-step structured reasoning. Round 1: Generate scene graph only. Round 2: Generate PDDL from scene graph. Hard template (--hard_template, default): strict domain predicate enforcement. Soft template (--soft_template): flexible predicate usage. |
| **VLLM scene graph → DINO → PDDL** | `generate_scene_graph_dino_pddl` | Three-step enhanced reasoning. Round 1: Generate scene graph. Round 2: DINO object detection from scene graph. Round 3: Generate PDDL from scene graph + spatial bbox data. Hard/soft template support via --hard_template/--soft_template flags. |
| **VLLM zero-shot PDDL (ViLain + GPT-4.1)** | `generate_villain_gpt41_pddl` | GPT-4.1 variant of ViLain pipeline. VLM → GPT-4.1 object detection → VLM PDDL generation. Control experiment for DINO comparison. |
| **VLLM captioning → PDDL + GPT-4.1** | `generate_villain_captioning_gpt41_pddl` | GPT-4.1 variant of captioning pipeline. Round 1 captioning → Round 2 GPT-4.1 object detection → Round 3 PDDL; Enhanced with GPT-4.1 spatial verification |
| **VLLM scene graph → GPT-4.1 → PDDL** | `generate_scene_graph_gpt41_pddl` | GPT-4.1 variant of scene graph pipeline. Round 1: Generate scene graph. Round 2: GPT-4.1 object detection from scene graph. Round 3: Generate PDDL from scene graph + spatial bbox data. Control experiment for DINO comparison. |
| **VLLM verify scene graph (prompt) → PDDL (Pix2Pred)** | `generate_vlm_prompt_scene_graph` | Generate all possible relations → prompt engineer VLLM; 3 steps |
| **VLLM JSON scene graph → action (VeriGraph)** | `generate_verigraph` | |
| **VLA → action (Pi0)** | `generate_pi0_action` | On ALFRED |
| **VLLM verify scene graph (logits) → PDDL (ours)** | `generate_multi_step` | |
| **CLIP-based VLM verify scene graph → PDDL (ours)** | `generate_multi_step_with_sgclip_vlm` | |
| **VLLM verify ID scene graph → mapping → PDDL (ours)** | `generate_verify_id_scene_graph` | |

