(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green_block
        orange_block
        purple_block
        red_block
        blue_block
        yellow_block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (on blue_block yellow_block)
        (on red_block blue_block)
        (on purple_block red_block)
        (on orange_block purple_block)
        (on green_block orange_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal (and
        (on red_block orange_block)
        (on orange_block yellow_block)
        (on yellow_block blue_block)
        (on blue_block green_block)
        (on green_block purple_block)
        (clear red_block)
        (ontable purple_block)
    ))
)