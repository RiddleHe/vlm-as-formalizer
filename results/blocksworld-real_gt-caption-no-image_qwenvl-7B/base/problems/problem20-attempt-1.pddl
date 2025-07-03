(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1
        blue_block1
        blue_block2
        green_block1
        green_block2
        red_block1
        red_block2
        purple_block1
        purple_block2
        orange_block1
        orange_block2
        yellow_block1
        yellow_block2
        table
    )
    (:init
        (clear blue_block1)
        (clear blue_block2)
        (clear green_block1)
        (clear green_block2)
        (clear red_block1)
        (clear red_block2)
        (clear purple_block1)
        (clear purple_block2)
        (clear orange_block1)
        (clear orange_block2)
        (clear yellow_block1)
        (clear yellow_block2)
        (ontable blue_block1)
        (ontable blue_block2)
        (ontable green_block1)
        (ontable green_block2)
        (ontable red_block1)
        (ontable red_block2)
        (ontable purple_block1)
        (ontable purple_block2)
        (ontable orange_block1)
        (ontable orange_block2)
        (ontable yellow_block1)
        (ontable yellow_block2)
        (handempty robot1)
        (on blue_block1 table)
        (on blue_block2 blue_block1)
        (on green_block1 table)
        (on green_block2 green_block1)
        (on red_block1 table)
        (on red_block2 red_block1)
        (on purple_block1 table)
        (on purple_block2 purple_block1)
        (on orange_block1 table)
        (on orange_block2 orange_block1)
        (on yellow_block1 table)
        (on yellow_block2 yellow_block1)
    )
    (:goal
        (and
            (on yellow_block2 orange_block2)
            (on orange_block2 red_block2)
            (on red_block2 purple_block2)
            (on purple_block2 table)
            (on blue_block2 green_block2)
            (on green_block2 table)
        )
    )
)