(define (problem blocksworld)
(:domain blocksworld)
(:objects
    robot1
    yellow_block - block
    orange_block - block
    purple_block - block
    green_block - block
    red_block - block
    blue_block - block
    table
)
(:init
    (ontable yellow_block)
    (ontable orange_block)
    (ontable purple_block)
    (ontable green_block)
    (ontable red_block)
    (ontable blue_block)
    (handempty robot1)
)
(:goal
    (and
        (on yellow_block orange_block)
        (on purple_block green_block)
        (on red_block blue_block)
    )
)
)