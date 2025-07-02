(define (problem blocksworld_problem_corrected)
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
        (clear yellow_block)
        (cleap purple_block)
        (ontable red_block)
        (ontable orange_block)
        (ontable pink_block)
        (ontable yellow_block)
        (on yellow_block pink_block)
        (on orange_block red_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block pink_block)
        (clear yellow_block)
        (on yellow_block orange_block)
        (clear pink_block)
    ))
)