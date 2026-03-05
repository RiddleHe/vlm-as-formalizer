(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        red_block
        yellow_block
        green_block
        blue_block
        purple_block
        robot1 - robot
    )
    (:init
        (ontable red_block)
        (ontable yellow_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable purple_block)
        (clear red_block)
        (clear yellow_block)
        (clear green_block)
        (clear blue_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on blue_block red_block)
        (on yellow_block green_block)
        (on green_block red_block)
        (on red_block purple_block)
        (clear blue_block)
        (clear yellow_block)
    ))
)