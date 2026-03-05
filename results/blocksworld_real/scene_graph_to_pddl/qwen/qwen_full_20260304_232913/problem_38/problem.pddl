(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        orange_block
        yellow_block
        purple_block
        red_block
        blue_block
        green_block
        robot1 - robot
    )
    (:init
        (ontable blue_block)
        (ontable orange_block)
        (ontable purple_block)
        (clear blue_block)
        (clear green_block)
        (clear orange_block)
        (clear purple_block)
        (clear red_block)
        (clear yellow_block)
        (handempty robot1)
        (on green_block orange_block)
        (on yellow_block purple_block)
        (on red_block yellow_block)
    )
    (:goal (and
        (on orange_block yellow_block)
        (on yellow_block purple_block)
        (on purple_block red_block)
        (on red_block blue_block)
        (on blue_block green_block)
    ))
)