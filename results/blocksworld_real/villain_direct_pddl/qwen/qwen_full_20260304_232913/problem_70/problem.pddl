(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green_block - block
        blue_block - block
        yellow_block - block
        purple_block - block
        orange_block - block
        red_block - block
        robot1 - robot
    )
    (:init
        (on green_block blue_block)
        (on blue_block yellow_block)
        (on yellow_block purple_block)
        (ontable purple_block)
        (clear green_block)
        (ontable red_block)
        (clear red_block)
        (ontable orange_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on yellow_block red_block)
        (on red_block orange_block)
        (on orange_block blue_block)
        (on blue_block purple_block)
        (on purple_block green_block)
        (clear yellow_block)
    ))
)