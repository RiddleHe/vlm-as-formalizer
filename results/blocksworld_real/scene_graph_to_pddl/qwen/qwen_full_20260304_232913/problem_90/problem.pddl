(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block - block
        red_block - block
        green_block - block
        orange_block - block
        yellow_block - block
        blue_block - block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (on red_block purple_block)
        (on green_block red_block)
        (on orange_block green_block)
        (on yellow_block orange_block)
        (on blue_block yellow_block)
        (clear blue_block)
        (clear red_block)
        (clear green_block)
        (clear orange_block)
        (clear yellow_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on red_block blue_block)
        (on orange_block yellow_block)
        (on purple_block green_block)
    ))
)