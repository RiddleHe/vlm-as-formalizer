(define (problem blocksworld_stacks3)
  (:domain blocksworld)
  (:objects
    block_red block_yellow block_orange block_purple block_blue block_green - block
    robot1 - robot
  )
  (:init
    ;; initial tower (bottom -> top): green, blue, purple, orange, yellow, red
    (ontable block_green)
    (on block_blue block_green)
    (on block_purple block_blue)
    (on block_orange block_purple)
    (on block_yellow block_orange)
    (on block_red block_yellow)

    ;; clear status
    (clear block_red)

    ;; robot status
    (handempty robot1)
  )
  (:goal
    (and
      ;; Create 3 stacks: yellow over green, blue over purple, orange over red
      (on block_yellow block_green)
      (on block_blue block_purple)
      (on block_orange block_red)
    )
  )
)