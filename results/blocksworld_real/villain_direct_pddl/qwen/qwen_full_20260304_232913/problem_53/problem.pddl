(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        blue_block - block
        orange_block - block
        yellow_block - block
        green_block - block
        red_block - block
        purple_block - block
        robot1 - robot
    )
    (:init
        (on blue_block orange_block)
        (on yellow_block green_block)
        (on red_block purple_block)
        (clear blue_block)
        (clear yellow_block)
        (clear red_block)
        (ontable orange_block)
        (ontable green_block)
        (ontable purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block yellow_block)
        (on green_block blue_block)
        (on purple_block red_block)
        (clear orange_block)
        (clear green_block)
        (clear purple_block)
    ))
)