(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        table - table
        orange_block1 - block
        orange_block2 - block
        yellow_block1 - block
        yellow_block2 - block
        blue_block1 - block
        blue_block2 - block
        purple_block1 - block
        purple_block2 - block
        red_block1 - block
        red_block2 - block
        green_block1 - block
        green_block2 - block
        blue_block3 - block
        orange_block3 - block
        red_block3 - block
        purple_block3 - block
        green_block3 - block
        yellow_block3 - block
    )
    (:init
        (clear orange_block1)
        (clear orange_block2)
        (clear yellow_block1)
        (clear yellow_block2)
        (clear blue_block1)
        (clear blue_block2)
        (clear purple_block1)
        (clear purple_block2)
        (clear red_block1)
        (clear red_block2)
        (clear green_block1)
        (clear green_block2)
        (ontable orange_block1)
        (ontable orange_block2)
        (ontable yellow_block1)
        (ontable yellow_block2)
        (ontable blue_block1)
        (ontable blue_block2)
        (ontable purple_block1)
        (ontable purple_block2)
        (ontable red_block1)
        (ontable red_block2)
        (ontable green_block1)
        (ontable green_block2)
        (handempty robot1)
        (ontable robot1)
    )
    (:goal (and
        (on green_block3 yellow_block3)
        (on red_block3 purple_block3)
        (on blue_block3 orange_block3)
        (on orange_block3 orange_block2)
        (on orange_block2 orange_block1)
        (on blue_block3 table)
        (on red_block3 table)
        (on purple_block3 table)
        (on green_block3 table)
        (on yellow_block3 table)
        (handempty robot1)
    ))
)