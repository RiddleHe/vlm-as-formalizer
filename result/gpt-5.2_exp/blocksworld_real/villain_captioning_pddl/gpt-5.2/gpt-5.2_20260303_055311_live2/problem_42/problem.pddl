(define (problem blocksworld_scene_3stacks)
  (:domain blocksworld)
  (:objects
    block_green block_yellow block_purple block_red block_orange block_blue - block
    robot1 - robot
  )
  (:init
    ;; single tower (top to bottom): green, yellow, purple, red, orange, blue
    (on block_green block_yellow)
    (on block_yellow block_purple)
    (on block_purple block_red)
    (on block_red block_orange)
    (on block_orange block_blue)

    (ontable block_blue)

    (clear block_green)

    (handempty robot1)
  )
  (:goal
    (and
      ;; Create 3 stacks:
      (on block_purple block_green)
      (on block_orange block_red)
      (on block_blue block_yellow)
      ;; bases of the three stacks on the table
      (ontable block_green)
      (ontable block_red)
      (ontable block_yellow)
    )
  )
)