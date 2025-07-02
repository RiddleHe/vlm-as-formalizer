(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        blue_block green_block yellow_block orange_block1 orange_block2 red_block purple_block - block
    )
    (:init
        (handempty robot1)
        (clear blue_block)
        (clear orange_block1)
        (on green_block yellow_block)
        (on blue_block green_block)
        (ontable yellow_block)
        (ontable orange_block1)
        (on red_block orange_block2)
        (on purple_block red_block)
        (ontable orange_block2)
        (clear red_block)
        (clear purple_block)
    )
    (:goal
        (and
            (on yellow_block blue_block)
            (on green_block yellow_block)
            (on red_block orange_block2)
            (on orange_block1 red_block)
            (on orange_block1 green_block)
            (on orange_block1 purple_block)
            (clear orange_block2)
        )
    )
)