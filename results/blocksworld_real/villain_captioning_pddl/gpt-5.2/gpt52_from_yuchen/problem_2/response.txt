(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    block_green block_red block_purple block_blue block_orange block_yellow - block
    robot1 - robot
  )
  (:init
    ;; left stack (bottom -> top): red, purple, blue, orange
    (ontable block_red)
    (on block_purple block_red)
    (on block_blue block_purple)
    (on block_orange block_blue)

    ;; right stack (bottom -> top): yellow, green
    (ontable block_yellow)
    (on block_green block_yellow)

    ;; clear blocks (tops of stacks)
    (clear block_orange)
    (clear block_green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; required single stack (bottom -> top): yellow, orange, blue, purple, red, green
      (ontable block_yellow)
      (on block_orange block_yellow)
      (on block_blue block_orange)
      (on block_purple block_blue)
      (on block_red block_purple)
      (on block_green block_red)
    )
  )
)