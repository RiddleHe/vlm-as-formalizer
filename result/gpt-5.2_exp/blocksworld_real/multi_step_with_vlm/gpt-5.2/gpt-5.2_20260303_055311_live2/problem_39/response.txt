(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        blue_block - block
        yellow_block - block
        purple_block - block
        red_block - block
        green_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block blue_block)
        (on yellow_block purple_block)
        (ontable blue_block)
        (ontable purple_block)
        (ontable red_block)
        (ontable green_block)
        (clear orange_block)
        (clear yellow_block)
        (clear red_block)
        (clear green_block)
        (handempty robot_arm)
        (handfull robot_arm)
    )
    (:goal (and
    (on orange_block blue_block)
    (on blue_block yellow_block)
    (on purple_block red_block)
    (on red_block green_block)
)))
