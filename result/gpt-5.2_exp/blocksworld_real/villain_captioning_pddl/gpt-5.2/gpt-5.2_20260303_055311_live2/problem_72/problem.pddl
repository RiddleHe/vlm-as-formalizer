(define (problem blocksworld_stack1_orange_purple_green_blue_red_yellow)
  (:domain blocksworld)
  (:objects
    block_orange block_purple block_green block_blue block_red block_yellow - block
    robot1 - robot
  )
  (:init
    (ontable block_orange)
    (ontable block_purple)
    (ontable block_green)
    (ontable block_blue)
    (ontable block_red)
    (ontable block_yellow)

    (clear block_orange)
    (clear block_purple)
    (clear block_green)
    (clear block_blue)
    (clear block_red)
    (clear block_yellow)

    (handempty robot1)
  )
  (:goal
    (and
      (on block_orange block_purple)
      (on block_purple block_green)
      (on block_green block_blue)
      (on block_blue block_red)
      (on block_red block_yellow)
      (ontable block_yellow)
    )
  )
)