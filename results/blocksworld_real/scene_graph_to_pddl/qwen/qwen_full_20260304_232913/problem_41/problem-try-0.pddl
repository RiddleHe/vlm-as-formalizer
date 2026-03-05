(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange_block
        blue_block
        purple_block
        green_block
        red_block
        yellow_block
        robot1 - robot
    )
    (:init
        (ontable orange_block)
        (ontable blue_block)
        (ontable yellow_block)
        (clear orange_block)
        (clear blue_block)
        (clear purple_block)
        (clear yellow_block)
        (on red_block yellow_block)
        (on green_block red_block)
        (on purple_block green_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block purple_block)
        (on green_block blue_block)
        (on yellow_block red_block)
    ))
)