# Baseline Methods Implementation Table

| Baseline | Function Name | Annotation |
|----------|---------------|------------|
| **VLLM zero-shot planning (ViLA)** | `generate_vila_planning` | Replicate prompt |
| **VLLM zero-shot PDDL (ViLain)** | `generate_villain_pddl` | Clone + install Dino / BLIP; If BLIP == VLLM, use VLLM; Review prompt (delete one-shot and other hacking methods) |
| **VLLM direct PDDL generation** | `generate_villain_direct_pddl` | prompt = "given image + instruction, write the problem file" |
| **VLLM captioning → PDDL** | `generate_villain_captioning_pddl` | Round 1 captioning → Round 2 PDDL; no bbox VLLM normalized coordinates |
| **VLLM captioning → PDDL + DINO** | `generate_villain_captioning_dino_pddl` | Round 1 captioning → Round 2 DINO → Round 3 PDDL; Enhanced with spatial verification |
| **VLLM scene graph → PDDL** | `generate_scene_graph_to_pddl` | Bbox vs no bbox; Hard domain template (demand at the end the only predicates to use) vs soft domain template (no demand); Round 1 graph → Round 2 PDDL |
| **VLLM verify scene graph (prompt) → PDDL (Pix2Pred)** | `generate_vlm_prompt_scene_graph` | Generate all possible relations → prompt engineer VLLM; 3 steps |
| **VLLM JSON scene graph → action (VeriGraph)** | `generate_verigraph` | |
| **VLA → action (Pi0)** | `generate_pi0_action` | On ALFRED |
| **VLLM verify scene graph (logits) → PDDL (ours)** | `generate_multi_step` | |
| **CLIP-based VLM verify scene graph → PDDL (ours)** | `generate_multi_step_with_sgclip_vlm` | |
| **VLLM verify ID scene graph → mapping → PDDL (ours)** | `generate_verify_id_scene_graph` | |

