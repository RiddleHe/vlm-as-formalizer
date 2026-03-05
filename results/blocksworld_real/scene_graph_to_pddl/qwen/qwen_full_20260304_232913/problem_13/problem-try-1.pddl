(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow_block
        purple_block
        blue_block
        green_block
        orange_block
        red_block
        robot_arm - robot
    )
    (:init
        (ontable yellow_block)
        (ontable red_block)
        (clear blue_block)
        (clear orange_block)
        (clear yellow_block)
        (clear red_block)
        (handempty robot_arm)
        (on blue_block purple_block)
        (on purple_block yellow_block)
        (on green_block red_block)
        (on orange_block green_block)
    )
    (:goal (and
        (on blue_block yellow_block)
        (on orange_block red_block)
        (on red_block purple_block)
        (on purple_block green_block)
    ))
)