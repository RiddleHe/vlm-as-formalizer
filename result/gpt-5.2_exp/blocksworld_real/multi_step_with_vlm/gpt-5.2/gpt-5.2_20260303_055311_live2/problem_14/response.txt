(define (problem blocksworld)    (:domain blocksworld)    (:objects
        purple_block - block
        yellow_block - block
        orange_block - block
        blue_block - block
        red_block - block
        green_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block blue_block)
        (on orange_block red_block)
        (on red_block green_block)
        (ontable blue_block)
        (ontable green_block)
        (clear purple_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on purple_block yellow_block)
    (on yellow_block orange_block)
    (on blue_block red_block)
    (on red_block green_block)
  )
))
