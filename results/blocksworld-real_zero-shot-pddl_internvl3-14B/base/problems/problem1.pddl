(define (problem blocksworld-stacks)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        orange_block - block
        yellow_block - block
        green_block - block
        blue_block - block
        red_block - block
        purple_block - block
    )
    (:init
        (handempty robot1)
        (clear orange_block)
        (ontable orange_block)
        (clear yellow_block)
        (ontable yellow_block)
        (clear green_block)
        (ontable green_block)
        (clear blue_block)
        (ontable blue_block)
        (clear red_block)
        (ontable red_block)
        (clear purple_block)
        (ontable purple_block)
    )
    (:goal
        (and
            (on orange_block yellow_block)
            (on green_block blue_block)
            (on red_block purple_block)
        )
    )
)