(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        yellow_block - block
        purple_block - block
        red_block - block
        orange_block - block
        blue_block - block
        robot_1 - robot
    )
    (:init
        (on green_block purple_block)
        (on yellow_block red_block)
        (on red_block purple_block)
        (on orange_block red_block)
        (on blue_block orange_block)
        (ontable blue_block)
        (clear green_block)
        (handempty robot_1)
    )
    (:goal (and 
    (on purple_block green_block)
    (on orange_block red_block)
    (on blue_block yellow_block)
)))
