(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        blue_block - block
        orange_block - block
        green_block - block
        purple_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (on red_block orange_block)
        (ontable orange_block)
        (ontable green_block)
        (ontable purple_block)
        (ontable yellow_block)
        (clear red_block)
        (clear green_block)
        (clear purple_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on orange_block red_block)
    (on red_block green_block)
    (on green_block blue_block)
    (on blue_block purple_block)
    (on purple_block yellow_block)
    (ontable yellow_block)
)))
