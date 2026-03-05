(define (problem blocksworld_two_stacks)
  (:domain blocksworld)
  (:objects
    blue_block pink_block red_block
    yellow_block orange_block green_block - block
    robot_arm - robot
  )
  (:init
    (ontable blue_block)
    (ontable pink_block)
    (ontable red_block)
    (ontable yellow_block)
    (ontable orange_block)
    (ontable green_block)
    (clear blue_block)
    (clear pink_block)
    (clear red_block)
    (clear yellow_block)
    (clear orange_block)
    (clear green_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_block pink_block)
      (on pink_block red_block)
      (ontable red_block)
      (on yellow_block orange_block)
      (on orange_block green_block)
      (ontable green_block)
    )
  )
)