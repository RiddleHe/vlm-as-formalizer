(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        orange_block - block
        purple_block - block
        green_block - block
        blue_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (ontable red_block)
        (ontable orange_block)
        (ontable purple_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable yellow_block)
        (clear red_block)
        (clear orange_block)
        (clear purple_block)
        (clear green_block)
        (clear blue_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on blue_block purple_block)
    (on green_block yellow_block)
    (on red_block orange_block)
)))
