(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange_block
        yellow_block
        purple_block
        red_block
        blue_block
        green_block
        robot1 - robot
    )
    (:init
        (ontable orange_block)
        (ontable blue_block)
        (on green_block orange_block)
        (on red_block yellow_block)
        (on yellow_block purple_block)
        (clear green_block)
        (clear blue_block)
        (clear red_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block yellow_block)
        (on yellow_block purple_block)
        (on purple_block red_block)
        (on red_block blue_block)
        (on blue_block green_block)
        (clear orange_block)
        (ontable green_block)
    ))
)