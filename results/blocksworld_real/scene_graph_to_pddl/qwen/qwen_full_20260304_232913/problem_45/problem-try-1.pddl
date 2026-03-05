(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        red_block
        blue_block
        yellow_block
        orange_block
        green_block
        purple_block
        robot1 - robot
    )
    (:init
        (ontable red_block)
        (ontable blue_block)
        (ontable yellow_block)
        (ontable orange_block)
        (ontable green_block)
        (ontable purple_block)
        (clear red_block)
        (clear blue_block)
        (clear yellow_block)
        (clear orange_block)
        (clear green_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block green_block)
        (on red_block yellow_block)
        (on orange_block blue_block)
    ))
)