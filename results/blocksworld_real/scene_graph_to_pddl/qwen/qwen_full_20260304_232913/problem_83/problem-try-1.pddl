(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        green_block
        blue_block
        yellow_block
        red_block
        purple_block
        orange_block
        robot1 - robot
    )
    (:init
        (on green_block blue_block)
        (on blue_block yellow_block)
        (on yellow_block red_block)
        (on red_block purple_block)
        (ontable purple_block)
        (ontable orange_block)
        (clear green_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block red_block)
        (on red_block blue_block)
        (on blue_block orange_block)
        (on orange_block yellow_block)
        (on yellow_block green_block)
        (clear purple_block)
        (ontable green_block)
    ))
)