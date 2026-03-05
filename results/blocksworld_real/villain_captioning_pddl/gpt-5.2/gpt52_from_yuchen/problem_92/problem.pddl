(define (problem blocksworld_two_stacks_01)
  (:domain blocksworld)

  (:objects
    block_orange block_red block_purple block_yellow block_green block_blue - block
    robot1 - robot
  )

  (:init
    ;; tower from top to bottom: orange, red, purple, yellow, green, blue (on table)
    (on block_orange block_red)
    (on block_red block_purple)
    (on block_purple block_yellow)
    (on block_yellow block_green)
    (on block_green block_blue)
    (ontable block_blue)

    (clear block_orange)

    (handempty robot1)
  )

  (:goal
    (and
      ;; Stack 1: red over green over purple
      (on block_red block_green)
      (on block_green block_purple)

      ;; Stack 2: orange over blue over yellow
      (on block_orange block_blue)
      (on block_blue block_yellow)
    )
  )
)