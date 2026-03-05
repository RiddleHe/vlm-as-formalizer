(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        blue_block
        orange_block
        red_block
        green_block
        yellow_block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable blue_block)
        (clear purple_block)
        (clear blue_block)
        (clear red_block)
        (clear green_block)
        (clear yellow_block)
        (handempty robot1)
        (on red_block green_block)
        (on green_block yellow_block)
        (on yellow_block blue_block)
        (on orange_block blue_block)
    )
    (:goal (and
        (on red_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block blue_block)
        (on green_block purple_block)
        (clear red_block)
        (clear green_block)
    ))
)