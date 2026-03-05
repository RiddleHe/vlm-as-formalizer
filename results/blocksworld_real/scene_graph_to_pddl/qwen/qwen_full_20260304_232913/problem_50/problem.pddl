(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange_block
        yellow_block
        blue_block
        purple_block
        red_block
        green_block
        robot1 - robot
    )
    (:init
        (ontable blue_block)
        (ontable green_block)
        (clear orange_block)
        (clear purple_block)
        (handempty robot1)
        (on orange_block yellow_block)
        (on yellow_block blue_block)
        (on purple_block red_block)
        (on red_block green_block)
    )
    (:goal (and
        (on purple_block blue_block)
        (on blue_block green_block)
        (on green_block red_block)
        (on red_block orange_block)
        (on orange_block yellow_block)
        (ontable yellow_block)
        (clear purple_block)
    ))
)