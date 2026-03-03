(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        red_block - block
        orange_block - block
        purple_block - block
        blue_block - block
        yellow_block - block
        robot_1 - robot
    )
    (:init
        (on green_block red_block)
        (on orange_block purple_block)
        (on purple_block yellow_block)
        (on blue_block purple_block)
        (ontable red_block)
        (ontable yellow_block)
        (clear green_block)
        (clear blue_block)
        (handempty robot_1)
    )
    (:goal (and 
    (on green_block red_block)
    (on orange_block purple_block)
    (on blue_block yellow_block)
)))
