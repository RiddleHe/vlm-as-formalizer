(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        green_block
        orange_block
        red_block
        yellow_block
        blue_block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable green_block)
        (clear purple_block)
        (clear blue_block)
        (handempty robot1)
        (on blue_block green_block)
        (on yellow_block blue_block)
        (on red_block yellow_block)
        (on orange_block red_block)
    )
    (:goal (and
        (on red_block blue_block)
        (clear red_block)
        (on yellow_block green_block)
        (on green_block orange_block)
        (on orange_block purple_block)
        (clear yellow_block)
        (ontable purple_block)
    ))
)