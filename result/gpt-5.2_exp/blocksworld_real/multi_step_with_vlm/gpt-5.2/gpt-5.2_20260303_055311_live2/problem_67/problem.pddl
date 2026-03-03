(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        green_block - block
        yellow_block - block
        purple_block - block
        blue_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (on red_block blue_block)
        (on blue_block red_block)
        (ontable green_block)
        (ontable yellow_block)
        (ontable purple_block)
        (ontable orange_block)
        (clear red_block)
        (clear green_block)
        (clear yellow_block)
        (clear purple_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on red_block green_block)
    (on yellow_block purple_block)
    (on blue_block orange_block)
  )
))
