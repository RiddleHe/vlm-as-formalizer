(define (problem blocksworld_stack_task)
  (:domain blocksworld)
  (:objects
    yellow_block pink_block green_block red_block purple_block orange_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable purple_block)
    (ontable orange_block)

    (on yellow_block pink_block)
    (on pink_block green_block)
    (on red_block purple_block)

    (clear yellow_block)
    (clear red_block)
    (clear orange_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block pink_block)
      (on pink_block green_block)
      (on green_block red_block)
      (on red_block purple_block)
      (on purple_block orange_block)
    )
  )
)