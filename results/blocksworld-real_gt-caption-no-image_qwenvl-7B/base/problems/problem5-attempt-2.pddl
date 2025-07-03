(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        table - block
        red_block1 - block
        red_block2 - block
        yellow_block1 - block
        yellow_block2 - block
        orange_block1 - block
        orange_block2 - block
        purple_block1 - block
        purple_block2 - block
        blue_block1 - block
        blue_block2 - block
        green_block1 - block
        green_block2 - block
    )
    (:init
        (clear robot1)
        (ontable robot1)
        (handempty robot1)
        (on red_block1 yellow_block1)
        (on yellow_block1 table)
        (on red_block2 yellow_block1)
        (on orange_block1 orange_block2)
        (on orange_block2 table)
        (on purple_block1 purple_block2)
        (on purple_block2 table)
        (on blue_block1 blue_block2)
        (on blue_block2 table)
        (on green_block1 green_block2)
        (on green_block2 table)
    )
    (:goal
        (and
            (on yellow_block1 purple_block1)
            (on blue_block1 red_block1)
            (on orange_block1 green_block1)
        )
    )
)