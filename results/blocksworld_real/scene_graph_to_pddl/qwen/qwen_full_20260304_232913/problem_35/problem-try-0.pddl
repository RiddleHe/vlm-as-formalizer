(define (problem blockstacking)
    (:domain blocksworld)
    (:objects
        green_block
        yellow_block
        blue_block
        orange_block
        red_block
        purple_block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable yellow_block)
        (ontable red_block)
        (ontable purple_block)
        (on orange_block blue_block)
        (clear green_block)
        (clear yellow_block)
        (clear red_block)
        (clear purple_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block red_block)
        (on red_block blue_block)
        (on blue_block green_block)
        (clear purple_block)
    ))
)