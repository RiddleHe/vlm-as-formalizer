(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        yellow_block - block
        orange_block - block
        red_block - block
        purple_block - block
        blue_block - block
        green_block - block
    )
    (:init
        ; Initial positions of blocks and robot's state
        (on yellow_block orange_block)
        (on orange_block red_block)
        (ontable red_block)
        (clear green_block)
        (clear blue_block)
        (clear red_block)
        (clear orange_block)
        (clear yellow_block)
        (handempty robot1)
    )
    (:goal
        ; Conditions for creating two stacks
        (and
            (on yellow_block orange_block)
            (on orange_block red_block)
            (on red_block purple_block)
            (clear green_block)
            (clear blue_block)
            (on blue_block green_block)
            (clear blue_block)
        )
    )
)