(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        orange_block - block
        green_block - block
        blue_block - block
        yellow_block - block
        purple_block - block
        robot_1 - robot
    )
    (:init
        (ontable red_block)
        (ontable orange_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable yellow_block)
        (ontable purple_block)
        (clear red_block)
        (clear orange_block)
        (clear green_block)
        (clear blue_block)
        (clear yellow_block)
        (clear purple_block)
        (handempty robot_1)
    )
    (:goal (and 
    (on green_block orange_block)
    (on orange_block red_block)
    (on blue_block purple_block)
    (on purple_block yellow_block)
)))
