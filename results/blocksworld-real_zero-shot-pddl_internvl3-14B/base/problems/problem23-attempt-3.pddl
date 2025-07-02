(define (problem blocksworld_corrected_problem)
    (:domain blocksworld)
    (:objects 
        robot1 - robot
        yellow_block green_block blue_block orange_block1 orange_block2 purple_block red_block - block
    )
    (:init
        (handempty robot1)
        (clear orange_block1)
        (clear red_block)  ; Assume red block is clear and available
        ; Existing stacks
        (on blue_block green_block)
        (on green_block yellow_block)
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
            (on green_block orange_block1)
            (on orange_block2 green_block)
            (clear orange_block2)
        )
    )
)