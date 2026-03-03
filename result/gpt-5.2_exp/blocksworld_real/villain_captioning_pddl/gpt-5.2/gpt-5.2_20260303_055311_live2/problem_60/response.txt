(define (problem blocksworld_scene_stacks_2)
  (:domain blocksworld)
  (:objects
    block_orange block_blue block_yellow block_purple block_green block_red - block
    robot1 - robot
  )
  (:init
    ;; tower (top to bottom): green on purple on yellow on blue on orange (on table)
    (on block_green block_purple)
    (on block_purple block_yellow)
    (on block_yellow block_blue)
    (on block_blue block_orange)
    (ontable block_orange)

    ;; separate red block
    (ontable block_red)

    ;; clear conditions
    (clear block_green)
    (clear block_red)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over green
      (on block_red block_green)

      ;; stack 2: orange over blue over purple over yellow (yellow is bottom)
      (on block_orange block_blue)
      (on block_blue block_purple)
      (on block_purple block_yellow)
    )
  )
)