(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange_block
        blue_block
        purple_block
        red_block
        green_block
        yellow_block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (ontable red_block)
        (clear orange_block)
        (clear green_block)
        (clear red_block)
        (clear yellow_block)
        (handempty robot1)
        (on orange_block blue_block)
        (on blue_block purple_block)
        (on purple_block red_block)
        (on green_block yellow_block)
    )
    (:goal (and
        (on green_block red_block)
        (on red_block purple_block)
        (on purple_block blue_block)
        (on blue_block orange_block)
        (on orange_block yellow_block)
        (clear green_block)
        (ontable yellow_block)
    ))
)