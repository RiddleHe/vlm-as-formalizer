(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        purple_block - block
        orange_block - block
        yellow_block - block
        red_block - block
        green_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block orange_block)
        (on yellow_block red_block)
        (on red_block green_block)
        (ontable purple_block)
        (ontable orange_block)
        (ontable green_block)
        (clear blue_block)
        (clear purple_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on orange_block red_block)
    (on red_block yellow_block)
    (on blue_block purple_block)
    (on purple_block green_block)
)))
