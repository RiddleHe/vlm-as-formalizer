(define (problem blocksworld_stack)
    (:domain blocksworld)
    (:objects
        orange_block - block
        red_block - block
        yellow_block - block
        green_block - block
        blue_block - block
        purple_block - block
        robot1 - robot
    )
    (:init
        (ontable orange_block)
        (ontable red_block)
        (clear orange_block)
        (clear purple_block)
        (handempty robot1)
        (on blue_block green_block)
        (on green_block yellow_block)
        (on yellow_block red_block)
        (on purple_block blue_block)
    )
    (:goal (and
        (on purple_block blue_block)
        (on blue_block green_block)
        (on green_block yellow_block)
        (on yellow_block red_block)
        (on red_block orange_block)
        (clear purple_block)
        (ontable orange_block)
    ))
)