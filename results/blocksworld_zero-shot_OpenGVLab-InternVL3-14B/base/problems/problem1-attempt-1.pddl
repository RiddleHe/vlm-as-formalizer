(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        green_block yellow_block pink_block red_block robot
        - block
        r - robot)
    (:init
        (clear green_block)
        (ontable green_block)
        (clear yellow_block)
        (ontable yellow_block)
        (clear pink_block)
        (ontable pink_block)
        (clear red_block)
        (ontable red_block)
        (handempty r)
    )
    (:goal
        (and
            (on pink_block red_block)
            (on red_block yellow_block)
            (on yellow_block green_block)
        )
    )
)