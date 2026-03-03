(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        red_block - block
        yellow_block - block
        purple_block - block
        green_block - block
        blue_block - block
        robot_1 - robot
    )
    (:init
        (on orange_block red_block)
        (on yellow_block purple_block)
        (on green_block blue_block)
        (ontable red_block)
        (ontable purple_block)
        (ontable blue_block)
        (clear orange_block)
        (clear yellow_block)
        (clear green_block)
        (handempty robot_1)
    )
    (:goal (and
    (on yellow_block orange_block)
    (on red_block green_block)
    (on blue_block purple_block)
)))
