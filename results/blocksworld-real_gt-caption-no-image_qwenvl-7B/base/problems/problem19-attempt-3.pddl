(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        yellow_block1 - block
        yellow_block2 - block
        red_block1 - block
        red_block2 - block
        orange_block1 - block
        orange_block2 - block
        blue_block1 - block
        blue_block2 - block
        green_block1 - block
        green_block2 - block
        purple_block1 - block
        table - block
        blue - block
        orange - block
        yellow - block
        green - block
        red - block
        purple - block
    )
    (:init
        (clear yellow_block1 - block)
        (clear yellow_block2 - block)
        (clear red_block1 - block)
        (clear red_block2 - block)
        (clear orange_block1 - block)
        (clear orange_block2 - block)
        (clear blue_block1 - block)
        (clear blue_block2 - block)
        (clear green_block1 - block)
        (clear green_block2 - block)
        (clear purple_block1 - block)
        (ontable yellow_block1 - block)
        (ontable yellow_block2 - block)
        (ontable red_block1 - block)
        (ontable red_block2 - block)
        (ontable orange_block1 - block)
        (ontable orange_block2 - block)
        (ontable blue_block1 - block)
        (ontable blue_block2 - block)
        (ontable green_block1 - block)
        (ontable green_block2 - block)
        (ontable purple_block1 - block)
        (handempty robot1 - robot)
        (on yellow_block1 table - block)
        (on yellow_block2 yellow_block1 - block)
        (on red_block1 table - block)
        (on red_block2 red_block1 - block)
        (on orange_block1 table - block)
        (on orange_block2 orange_block1 - block)
        (on blue_block1 table - block)
        (on blue_block2 blue_block1 - block)
        (on green_block1 table - block)
        (on green_block2 green_block1 - block)
        (on purple_block1 table - block)
    )
    (:goal
        (and
            (on blue_block2 orange_block1 - block)
            (on yellow_block2 green_block1 - block)
            (on green_block2 red_block1 - block)
            (on red_block2 purple_block1 - block)
        )
    )
)