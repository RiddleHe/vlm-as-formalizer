(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        blue_block
        yellow_block
        orange_block
        red_block
        green_block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (ontable green_block)
        (clear purple_block)
        (clear orange_block)
        (handempty robot1)
        (on purple_block blue_block)
        (on blue_block yellow_block)
        (on orange_block red_block)
        (on red_block green_block)
    )
    (:goal (and
        (on yellow_block blue_block)
        (on blue_block purple_block)
        (on purple_block red_block)
        (on red_block green_block)
        (on green_block orange_block)
        (clear yellow_block)
        (ontable orange_block)
    ))
)