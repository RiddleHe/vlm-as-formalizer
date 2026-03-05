(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        blue_block - block
        orange_block - block
        green_block - block
        purple_block - block
        red_block - block
        yellow_block - block
        robot1 - robot
    )
    (:init
        (ontable blue_block)
        (ontable yellow_block)
        (ontable purple_block)
        (on orange_block green_block)
        (on green_block red_block)
        (clear blue_block)
        (clear yellow_block)
        (clear purple_block)
        (clear orange_block)
        (clear red_block)
        (handempty robot1)
    )
    (:goal (and
        (on blue_block orange_block)
        (on orange_block green_block)
        (on green_block purple_block)
        (on purple_block red_block)
        (on red_block yellow_block)
        (clear blue_block)
        (ontable yellow_block)
    ))
)