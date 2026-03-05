(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        green_block
        purple_block
        red_block
        orange_block
        blue_block
        yellow_block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable purple_block)
        (ontable red_block)
        (ontable orange_block)
        (ontable blue_block)
        (ontable yellow_block)
        (clear green_block)
        (clear purple_block)
        (clear red_block)
        (clear orange_block)
        (clear blue_block)
        (clear yellow_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block yellow_block)
        (on blue_block red_block)
        (on purple_block green_block)
        (clear orange_block)
        (clear blue_block)
        (clear purple_block)
    ))
)