(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green_block - block
        blue_block - block
        orange_block - block
        yellow_block - block
        red_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (ontable yellow_block)
        (ontable red_block)
        (ontable purple_block)
        (ontable orange_block)
        (clear green_block)
        (clear yellow_block)
        (clear red_block)
        (clear purple_block)
        (on green_block blue_block)
        (on blue_block orange_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on orange_block yellow_block)
        (on yellow_block green_block)
        (on green_block purple_block)
        (on purple_block red_block)
        (on red_block blue_block)
        (clear orange_block)
        (ontable blue_block)
    ))
)