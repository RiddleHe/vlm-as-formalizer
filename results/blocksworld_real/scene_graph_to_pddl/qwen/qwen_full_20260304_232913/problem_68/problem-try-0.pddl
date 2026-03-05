(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        purple_block
        yellow_block
        green_block
        orange_block
        blue_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable yellow_block)
        (ontable green_block)
        (on red_block blue_block)
        (on blue_block orange_block)
        (clear purple_block)
        (clear yellow_block)
        (clear green_block)
        (clear red_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block red_block)
        (on red_block green_block)
        (on green_block blue_block)
        (on blue_block purple_block)
        (on purple_block yellow_block)
        (ontable yellow_block)
        (clear orange_block)
    ))
)