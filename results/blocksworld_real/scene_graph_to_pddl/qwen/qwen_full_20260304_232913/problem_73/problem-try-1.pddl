(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block - block
        blue_block - block
        orange_block - block
        red_block - block
        green_block - block
        yellow_block - block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable blue_block)
        (clear purple_block)
        (clear blue_block)
        (clear orange_block)
        (clear yellow_block)
        (clear green_block)
        (clear red_block)
        (handempty robot1)
        (on orange_block blue_block)
        (on red_block green_block)
        (on green_block yellow_block)
    )
    (:goal (and
        (on red_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block blue_block)
        (on green_block purple_block)
        (clear red_block)
        (clear green_block)
    ))
)