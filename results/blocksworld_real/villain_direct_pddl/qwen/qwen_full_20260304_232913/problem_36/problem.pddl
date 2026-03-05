(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        orange_block - block
        yellow_block - block
        green_block - block
        purple_block - block
        red_block - block
        blue_block - block
        robot1 - robot
    )
    (:init
        (ontable orange_block)
        (ontable yellow_block)
        (ontable green_block)
        (ontable purple_block)
        (ontable red_block)
        (ontable blue_block)
        (clear orange_block)
        (clear yellow_block)
        (clear green_block)
        (clear purple_block)
        (clear red_block)
        (clear blue_block)
        (handempty robot1)
    )
    (:goal (and
        (on red_block yellow_block)
        (on yellow_block blue_block)
        (on orange_block green_block)
        (on green_block purple_block)
        (clear red_block)
        (clear orange_block)
    ))
)