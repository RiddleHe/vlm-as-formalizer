(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        green_block
        purple_block
        red_block
        yellow_block
        orange_block
        blue_block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable purple_block)
        (ontable red_block)
        (ontable yellow_block)
        (ontable orange_block)
        (ontable blue_block)
        (clear green_block)
        (clear purple_block)
        (clear red_block)
        (clear yellow_block)
        (clear orange_block)
        (clear blue_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block green_block)
        (on red_block yellow_block)
        (on orange_block blue_block)
        (clear purple_block)
        (clear red_block)
        (clear orange_block)
    ))
)