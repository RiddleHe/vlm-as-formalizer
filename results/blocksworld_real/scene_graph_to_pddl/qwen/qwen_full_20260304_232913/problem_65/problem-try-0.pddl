(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        red_block
        purple_block
        blue_block
        orange_block
        yellow_block
        green_block
        robot1 - robot
    )
    (:init
        (on red_block purple_block)
        (on purple_block blue_block)
        (ontable orange_block)
        (ontable yellow_block)
        (ontable green_block)
        (clear red_block)
        (clear orange_block)
        (clear yellow_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block red_block)
        (on yellow_block purple_block)
        (on purple_block blue_block)
        (on blue_block orange_block)
        (clear green_block)
        (clear yellow_block)
        (ontable orange_block)
    ))
)