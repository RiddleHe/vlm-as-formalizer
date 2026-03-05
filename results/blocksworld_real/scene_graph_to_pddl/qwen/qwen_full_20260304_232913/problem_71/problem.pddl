(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green_block
        purple_block
        orange_block
        red_block
        yellow_block
        blue_block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable purple_block)
        (ontable orange_block)
        (ontable yellow_block)
        (on red_block orange_block)
        (on blue_block yellow_block)
        (clear green_block)
        (clear purple_block)
        (clear red_block)
        (clear blue_block)
        (clear yellow_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block blue_block)
        (on red_block orange_block)
        (on yellow_block green_block)
    ))
)