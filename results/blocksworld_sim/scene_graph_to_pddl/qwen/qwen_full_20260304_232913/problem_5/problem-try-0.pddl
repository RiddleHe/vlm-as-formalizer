(define (problem blockstacking)
    (:domain blocksworld)
    (:objects
        green_block
        orange_block
        blue_block
        red_block
        yellow_block
        robot1 - robot
    )
    (:init
        (on green_block orange_block)
        (on orange_block blue_block)
        (on blue_block red_block)
        (on red_block yellow_block)
        (ontable yellow_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal (and
        (on yellow_block red_block)
        (on red_block blue_block)
        (on blue_block orange_block)
        (on orange_block green_block)
        (ontable green_block)
        (clear yellow_block)
    ))
)