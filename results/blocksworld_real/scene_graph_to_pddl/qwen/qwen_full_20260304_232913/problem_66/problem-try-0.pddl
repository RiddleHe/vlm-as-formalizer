(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green_block
        red_block
        yellow_block
        blue_block
        orange_block
        purple_block
        robot1 - robot
    )
    (:init
        (on red_block green_block)
        (on yellow_block blue_block)
        (on purple_block orange_block)
        (ontable blue_block)
        (ontable orange_block)
        (clear green_block)
        (clear purple_block)
        (clear blue_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block green_block)
        (on red_block blue_block)
        (on blue_block purple_block)
        (on purple_block yellow_block)
    ))
)