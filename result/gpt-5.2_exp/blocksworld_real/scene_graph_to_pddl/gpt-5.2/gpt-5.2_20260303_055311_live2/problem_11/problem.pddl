(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    block_purple_cube block_yellow_cube block_blue_cube block_red_cube block_green_cube block_orange_cube - block
    robot_arm_1 - robot
  )

  (:init
    (ontable block_yellow_cube)
    (ontable block_green_cube)
    (ontable block_orange_cube)

    (on block_purple_cube block_yellow_cube)
    (on block_red_cube block_green_cube)
    (on block_blue_cube block_red_cube)

    (clear block_purple_cube)
    (clear block_blue_cube)
    (clear block_orange_cube)

    (handempty robot_arm_1)
  )

  (:goal
    (and
      (on block_green_cube block_blue_cube)
      (on block_blue_cube block_purple_cube)
      (on block_purple_cube block_orange_cube)
      (on block_red_cube block_yellow_cube)
    )
  )
)