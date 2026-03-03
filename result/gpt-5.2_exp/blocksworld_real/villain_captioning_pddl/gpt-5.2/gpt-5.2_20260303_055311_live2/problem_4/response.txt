(define (problem blocksworld_scene1_two_stacks)
  (:domain blocksworld)
  (:objects
    block_orange block_red block_purple block_blue block_yellow block_green - block
    robot1 - robot
  )
  (:init
    ;; initial stack from the scene (bottom -> top):
    (ontable block_green)
    (on block_yellow block_green)
    (on block_blue block_yellow)
    (on block_purple block_blue)
    (on block_red block_purple)
    (on block_orange block_red)

    ;; clear/hand state
    (clear block_orange)
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: purple over green
      (on block_purple block_green)

      ;; Stack 2: blue over red over orange over yellow
      (on block_orange block_yellow)
      (on block_red block_orange)
      (on block_blue block_red)
    )
  )
)