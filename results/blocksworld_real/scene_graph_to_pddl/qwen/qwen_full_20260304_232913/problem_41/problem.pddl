(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        green_block
        orange_block
        yellow_block
        blue_block
        red_block
        robot_arm - robot
    )
    (:init
        (on orange_block yellow_block)
        (on green_block orange_block)
        (on purple_block green_block)
        (ontable yellow_block)
        (ontable blue_block)
        (clear purple_block)
        (clear orange_block)
        (clear yellow_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on orange_block purple_block)
        (on green_block blue_block)
        (on yellow_block red_block)
    ))
)