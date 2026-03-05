(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        yellow_block
        purple_block
        green_block
        orange_block
        blue_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (ontable red_block)
        (clear blue_block)
        (clear red_block)
        (clear yellow_block)
        (handempty robot1)
        (on orange_block green_block)
        (on green_block purple_block)
        (on purple_block yellow_block)
    )
    (:goal (and
        (on orange_block purple_block)
        (on purple_block blue_block)
        (on yellow_block red_block)
        (on red_block green_block)
        (clear orange_block)
        (clear yellow_block)
    ))
)