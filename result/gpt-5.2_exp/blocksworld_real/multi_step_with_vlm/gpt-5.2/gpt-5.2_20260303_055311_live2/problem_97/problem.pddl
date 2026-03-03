(define (problem blocksworld)    (:domain blocksworld)    (:objects
        yellow_block - block
        purple_block - block
        red_block - block
        orange_block - block
        green_block - block
        blue_block - block
        robot_arm - robot
    )
    (:init
        (ontable yellow_block)
        (ontable purple_block)
        (ontable red_block)
        (ontable orange_block)
        (ontable green_block)
        (ontable blue_block)
        (clear yellow_block)
        (clear purple_block)
        (clear red_block)
        (clear orange_block)
        (clear green_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on blue_block orange_block)
    (on green_block red_block)
    (on yellow_block purple_block)
)))
