(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        table - table
        green_block1 - block
        green_block2 - block
        green_block3 - block
        green_block4 - block
        green_block5 - block
        purple_block1 - block
        purple_block2 - block
        purple_block3 - block
        purple_block4 - block
        purple_block5 - block
        blue_block1 - block
        blue_block2 - block
        blue_block3 - block
        blue_block4 - block
        blue_block5 - block
        orange_block1 - block
        orange_block2 - block
        orange_block3 - block
        orange_block4 - block
        orange_block5 - block
        red_block1 - block
        red_block2 - block
        red_block3 - block
        red_block4 - block
        red_block5 - block
        yellow_block1 - block
        yellow_block2 - block
        yellow_block3 - block
        yellow_block4 - block
        yellow_block5 - block
    )
    (:init
        (clear green_block1)
        (clear green_block2)
        (clear green_block3)
        (clear green_block4)
        (clear green_block5)
        (clear purple_block1)
        (clear purple_block2)
        (clear purple_block3)
        (clear purple_block4)
        (clear purple_block5)
        (clear blue_block1)
        (clear blue_block2)
        (clear blue_block3)
        (clear blue_block4)
        (clear blue_block5)
        (clear orange_block1)
        (clear orange_block2)
        (clear orange_block3)
        (clear orange_block4)
        (clear orange_block5)
        (clear red_block1)
        (clear red_block2)
        (clear red_block3)
        (clear red_block4)
        (clear red_block5)
        (clear yellow_block1)
        (clear yellow_block2)
        (clear yellow_block3)
        (clear yellow_block4)
        (clear yellow_block5)
        (ontable green_block1)
        (ontable green_block2)
        (ontable green_block3)
        (ontable green_block4)
        (ontable green_block5)
        (ontable purple_block1)
        (ontable purple_block2)
        (ontable purple_block3)
        (ontable purple_block4)
        (ontable purple_block5)
        (ontable blue_block1)
        (ontable blue_block2)
        (ontable blue_block3)
        (ontable blue_block4)
        (ontable blue_block5)
        (ontable orange_block1)
        (ontable orange_block2)
        (ontable orange_block3)
        (ontable orange_block4)
        (ontable orange_block5)
        (ontable red_block1)
        (ontable red_block2)
        (ontable red_block3)
        (ontable red_block4)
        (ontable red_block5)
        (ontable yellow_block1)
        (ontable yellow_block2)
        (ontable yellow_block3)
        (ontable yellow_block4)
        (ontable yellow_block5)
        (handempty robot1)
        (on table robot1)
    )
    (:goal (and
        (on yellow_block1 blue_block1)
        (on blue_block1 purple_block1)
        (on red_block1 orange_block1)
        (on orange_block1 green_block1)
    ))
)