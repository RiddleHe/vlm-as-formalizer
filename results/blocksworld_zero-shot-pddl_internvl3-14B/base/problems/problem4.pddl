(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        yellow_block - block
        blue_block - block
        orange_block - block
        purple_block - block
        red_block - block
        robot1 - robot
    )
    (:init
        (clear yellow_block)
        (clear blue_block)
        (clear orange_block)
        (clear purple_block)
        (clear red_block)
        (ontable yellow_block)
        (ontable blue_block)
        (ontable orange_block)
        (ontable purple_block)
        (ontable red_block)
        (handempty robot1)
    )
    (:goal
        (and 
            (on orange_block yellow_block)
            (on yellow_block blue_block)
            (on blue_block purple_block)
            (on purple_block red_block)
        )
    )
)