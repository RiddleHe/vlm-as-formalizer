(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        green_block - block
        blue_block - block
        yellow_block - block
        red_block - block
        purple_block - block
        orange_block - block
        robot1 - robot
    )
    (:init
        (on green_block blue_block)
        (on blue_block yellow_block)
        (on yellow_block red_block)
        (on red_block purple_block)
        (ontable purple_block)
        (clear green_block)
        (ontable orange_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block red_block)
        (on red_block blue_block)
        (on blue_block orange_block)
        (on orange_block yellow_block)
        (on yellow_block green_block)
        (ontable green_block)
        (clear purple_block)
    ))
)