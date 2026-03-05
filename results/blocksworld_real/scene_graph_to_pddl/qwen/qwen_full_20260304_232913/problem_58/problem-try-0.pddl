(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        yellow_block
        orange_block
        purple_block
        green_block
        blue_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable red_block)
        (on orange_block purple_block)
        (clear yellow_block)
        (clear green_block)
        (clear blue_block)
        (clear red_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block yellow_block)
        (on blue_block orange_block)
        (on purple_block red_block)
    ))
)