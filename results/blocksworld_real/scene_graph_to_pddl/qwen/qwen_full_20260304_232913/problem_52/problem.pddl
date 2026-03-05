(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow_block
        red_block
        orange_block
        purple_block
        green_block
        blue_block
        robot1 - robot
    )
    (:init
        (on yellow_block red_block)
        (on red_block orange_block)
        (on purple_block green_block)
        (ontable orange_block)
        (ontable green_block)
        (ontable blue_block)
        (clear yellow_block)
        (clear purple_block)
        (clear blue_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block green_block)
        (on yellow_block red_block)
        (on orange_block blue_block)
    ))
)