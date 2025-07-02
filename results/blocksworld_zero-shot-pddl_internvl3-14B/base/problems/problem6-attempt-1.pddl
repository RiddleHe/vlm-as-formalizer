(define (problem blocksworld_problem_1)
    (:domain blocksworld)
    (:objects
        purple_block - block
        pink_block - block
        yellow_block - block
        orange_block - block
        red_block - block
        robot1 - robot
    )
    (:init
        (ontable orange_block)
        (clear yellow_block)
        (ontable yellow_block)
        (on yellow_block orange_block)
        (ontable pink_block)
        (clear pink_block)
        (on pink_block purple_block)
        (on purple_block red_block)
        (clear red_block)
        (handempty robot1)
    )
    (:goal (and
        (on pink_block purple_block)
        (clear pink_block)
        (on yellow_block orange_block)
        (clear yellow_block)
    ))
)