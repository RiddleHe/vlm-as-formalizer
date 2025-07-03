(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green_block - block
        red_block - block
        blue_block - block
        orange_block - block
        purple_block - block
        yellow_block - block
        robot1 - robot
        table - table
    )
    (:init
        (clear green_block)
        (on green_block red_block)
        (ontable green_block)
        (ontable red_block)
        (clear blue_block)
        (on blue_block orange_block)
        (on orange_block purple_block)
        (on purple_block yellow_block)
        (ontable blue_block)
        (ontable orange_block)
        (ontable purple_block)
        (ontable yellow_block)
        (handempty robot1)
        (ontable robot1)
    )
    (:goal
        (and
            (on green_block red_block)
            (on orange_block purple_block)
            (on blue_block yellow_block)
        )
    )
)