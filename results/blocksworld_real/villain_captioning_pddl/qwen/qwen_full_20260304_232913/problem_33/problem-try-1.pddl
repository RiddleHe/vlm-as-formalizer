(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        red_block - block
        blue_block - block
        orange_block - block
        yellow_block - block
        green_block - block
        purple_block - block
        robot1 - robot
    )
    (:init
        (on red_block blue_block)
        (clear red_block)
        (ontable orange_block)
        (clear orange_block)
        (ontable yellow_block)
        (clear yellow_block)
        (ontable green_block)
        (clear green_block)
        (ontable purple_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on blue_block orange_block)
        (on orange_block purple_block)
        (on purple_block yellow_block)
        (on yellow_block green_block)
        (on green_block red_block)
        (clear blue_block)
        (ontable red_block)
    ))
)