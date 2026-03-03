(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        yellow_block - block
        red_block - block
        purple_block - block
        orange_block - block
        blue_block - block
        robot_arm - robot
    )
    (:init
        (ontable green_block)
        (ontable yellow_block)
        (ontable red_block)
        (ontable purple_block)
        (ontable orange_block)
        (ontable blue_block)
        (clear green_block)
        (clear yellow_block)
        (clear red_block)
        (clear purple_block)
        (clear orange_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on green_block red_block)
    (on blue_block yellow_block)
    (on purple_block orange_block)
)))
