(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        purple_block - block
        red_block - block
        orange_block - block
        blue_block - block
        yellow_block - block
        robot_1 - robot
    )
    (:init
        (ontable green_block)
        (ontable purple_block)
        (ontable red_block)
        (ontable orange_block)
        (ontable blue_block)
        (ontable yellow_block)
        (clear green_block)
        (clear purple_block)
        (clear red_block)
        (clear orange_block)
        (clear blue_block)
        (clear yellow_block)
        (handempty robot_1)
    )
    (:goal (and 
    (on orange_block yellow_block)
    (on blue_block red_block)
    (on purple_block green_block)
)))
