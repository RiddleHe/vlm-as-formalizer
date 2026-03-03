(define (problem blocksworld_two_stacks_01)
  (:domain blocksworld)
  (:objects
    block_orange block_yellow block_purple block_green block_blue block_red - block
    robot1 - robot
  )
  (:init
    ;; tower configuration (top to bottom)
    (on block_orange block_yellow)
    (on block_yellow block_purple)
    (on block_purple block_green)
    (on block_green block_blue)
    (on block_blue block_red)
    (ontable block_red)

    ;; clear status
    (clear block_orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: red over purple
      (on block_red block_purple)

      ;; Stack 2: yellow over green over orange over blue
      (on block_yellow block_green)
      (on block_green block_orange)
      (on block_orange block_blue)
    )
  )
)