(define (problem blocksworld_stack)
    (:domain blocksworld)
    (:objects
        red_block
        yellow_block
        green_block
        blue_block
        purple_block
        orange_block
        robot1
    )
    (:init
        (ontable orange_block)
        (clear orange_block)
        (on red_block orange_block)
        (clear red_block)
        (on yellow_block red_block)
        (clear yellow_block)
        (on green_block yellow_block)
        (clear green_block)
        (on blue_block green_block)
        (clear blue_block)
        (on purple_block blue_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (ontable orange_block)
        (on red_block orange_block)
        (on yellow_block red_block)
        (on green_block yellow_block)
        (on blue_block green_block)
        (on purple_block blue_block)
    ))
)