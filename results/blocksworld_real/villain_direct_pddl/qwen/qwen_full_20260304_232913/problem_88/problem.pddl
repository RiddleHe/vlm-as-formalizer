(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        orange_block - block
        blue_block - block
        green_block - block
        red_block - block
        yellow_block - block
        purple_block - block
        robot1 - robot
    )
    (:init
        (on orange_block blue_block)
        (on blue_block green_block)
        (on red_block yellow_block)
        (ontable green_block)
        (ontable yellow_block)
        (ontable purple_block)
        (clear orange_block)
        (clear red_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block blue_block)
        (on yellow_block red_block)
        (on red_block purple_block)
        (on purple_block orange_block)
        (clear yellow_block)
        (ontable orange_block)
    ))
)