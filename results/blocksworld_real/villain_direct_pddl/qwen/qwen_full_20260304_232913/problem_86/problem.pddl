(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        red_block - block
        green_block - block
        blue_block - block
        yellow_block - block
        orange_block - block
        purple_block - block
        robot1 - robot
    )
    (:init
        (on red_block green_block)
        (on yellow_block orange_block)
        (ontable green_block)
        (ontable orange_block)
        (ontable blue_block)
        (ontable purple_block)
        (clear red_block)
        (clear yellow_block)
        (clear blue_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block orange_block)
        (on orange_block purple_block)
        (on purple_block blue_block)
        (on yellow_block red_block)
        (ontable blue_block)
        (ontable red_block)
        (clear green_block)
        (clear yellow_block)
    ))
)