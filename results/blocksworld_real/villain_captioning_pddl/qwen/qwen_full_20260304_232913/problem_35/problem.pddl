(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green_block - block
        yellow_block - block
        orange_block - block
        blue_block - block
        red_block - block
        purple_block - block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (clear green_block)
        (ontable yellow_block)
        (clear yellow_block)
        (ontable red_block)
        (clear red_block)
        (ontable purple_block)
        (clear purple_block)
        (on orange_block blue_block)
        (ontable blue_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block red_block)
        (on red_block blue_block)
        (on blue_block green_block)
        (clear purple_block)
        (ontable green_block)
    ))
)