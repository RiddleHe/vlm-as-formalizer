(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange_block - block
        red_block - block
        yellow_block - block
        blue_block - block
        purple_block - block
        green_block - block
        robot1 - robot
    )
    (:init
        (ontable orange_block)
        (ontable purple_block)
        (ontable green_block)
        (on blue_block orange_block)
        (on red_block green_block)
        (on yellow_block red_block)
        (clear blue_block)
        (clear purple_block)
        (clear yellow_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block red_block)
        (on red_block yellow_block)
        (on blue_block purple_block)
        (on purple_block green_block)
        (clear orange_block)
        (clear blue_block)
    ))
)