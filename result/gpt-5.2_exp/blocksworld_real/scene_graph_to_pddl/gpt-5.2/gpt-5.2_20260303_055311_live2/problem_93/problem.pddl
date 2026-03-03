(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    green_block_left - block
    blue_block_leftcenter - block
    orange_block_frontleft - block
    yellow_block_stackbottom - block
    red_block_stackmiddle - block
    purple_block_stacktop - block
    robot_arm - robot
  )
  (:init
    (ontable green_block_left)
    (ontable blue_block_leftcenter)
    (ontable orange_block_frontleft)
    (ontable yellow_block_stackbottom)

    (on red_block_stackmiddle yellow_block_stackbottom)
    (on purple_block_stacktop red_block_stackmiddle)

    (clear green_block_left)
    (clear blue_block_leftcenter)
    (clear orange_block_frontleft)
    (clear purple_block_stacktop)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_block_frontleft purple_block_stacktop)
      (on purple_block_stacktop red_block_stackmiddle)
      (on red_block_stackmiddle blue_block_leftcenter)
      (on blue_block_leftcenter yellow_block_stackbottom)
      (on yellow_block_stackbottom green_block_left)
    )
  )
)