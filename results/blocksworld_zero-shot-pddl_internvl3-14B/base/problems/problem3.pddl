(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        yellow_block - block
        green_block - block
        pink_block - block
        red_block - block
        purple_block - block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (ontable green_block)
        (ontable pink_block)
        (ontable red_block)
        (ontable purple_block)
        (clear yellow_block)
        (clear green_block)
        (clear pink_block)
        (clear red_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal
        (and
            (on yellow_block green_block)
            (on green_block pink_block)
            (on red_block purple_block)
        )
    )
)