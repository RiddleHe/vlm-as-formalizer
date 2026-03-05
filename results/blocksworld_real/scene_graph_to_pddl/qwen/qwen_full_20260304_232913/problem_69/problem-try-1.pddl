(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        orange_block
        yellow_block
        green_block
        red_block
        blue_block
        robot_arm
    )
    (:init
        (ontable purple_block)
        (ontable orange_block)
        (ontable yellow_block)
        (ontable green_block)
        (ontable red_block)
        (clear purple_block)
        (clear orange_block)
        (clear yellow_block)
        (clear green_block)
        (clear red_block)
        (clear blue_block)
        (on blue_block red_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on yellow_block orange_block)
        (on green_block purple_block)
        (on purple_block red_block)
        (on red_block blue_block)
        (clear yellow_block)
        (clear green_block)
    ))
)