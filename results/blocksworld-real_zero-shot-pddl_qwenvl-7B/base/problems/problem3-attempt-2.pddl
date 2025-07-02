(define (problem blocksworld)
(:domain blocksworld)
(:objects
    robot1
    purple_block
    red_block
    yellow_block
    orange_block
    green_block
    blue_block
    table
)
(:init
    (ontable purple_block)
    (ontable red_block)
    (ontable yellow_block)
    (ontable orange_block)
    (ontable green_block)
    (ontable blue_block)
    (handempty robot1)
)
(:goal
    (and
        (on purple_block red_block)
        (on yellow_block orange_block)
        (on orange_block green_block)
        (on green_block blue_block)
    )
)
)