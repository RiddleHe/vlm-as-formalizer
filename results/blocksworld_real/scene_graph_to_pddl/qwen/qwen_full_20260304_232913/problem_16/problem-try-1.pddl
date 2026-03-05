(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        orange_block
        blue_block
        red_block
        yellow_block
        green_block
        robot1 - robot
    )
    (:init
        (on purple_block orange_block)
        (on orange_block blue_block)
        (on red_block yellow_block)
        (ontable yellow_block)
        (ontable green_block)
        (clear purple_block)
        (clear red_block)
        (clear green_block)
        (clear yellow_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block red_block)
        (on red_block orange_block)
        (on orange_block purple_block)
        (on purple_block blue_block)
        (on blue_block yellow_block)
        (clear green_block)
        (ontable yellow_block)
    ))
)