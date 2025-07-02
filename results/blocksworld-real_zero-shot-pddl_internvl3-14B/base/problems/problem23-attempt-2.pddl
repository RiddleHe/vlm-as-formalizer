(define (problem blocksworld_corrected_problem)
    (:domain blocksworld)
    (:objects 
        robot1 - robot
        yellow_block green_block blue_block orange_block1 orange_block2 purple_block red_block - block
    )
    (:init
        (handempty robot1)
        (clear orange_block1) ; Assuming orange_block1 is clear; this will be used for the new stack
        (clear purple_block)
        (on green_block yellow_block)
        (on blue_block green_block)
        (ontable yellow_block)
        (ontable orange_block1)
        (on orange_block2 purple_block)
        (clear orange_block2)
    )
    (:goal
        (and
            (on yellow_block blue_block)
            (on green_block yellow_block)
            (on orange_block1 red_block)
            (on orange_block2 green_block)
            (on orange_block2 purple_block)
            (clear orange_block2)
        )
    )
)