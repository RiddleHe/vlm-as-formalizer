(define (problem blockworld_task)
    (:domain blocksworld)
    (:objects
        purple_block - block
        orange_block - block
        yellow_block - block
        green_block - block
        red_block - block
        blue_block - block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable orange_block)
        (ontable yellow_block)
        (ontable green_block)
        (on blue_block red_block)
        (ontable red_block)
        (clear purple_block)
        (clear orange_block)
        (clear yellow_block)
        (clear green_block)
        (clear blue_block)
        (handempty robot1)
    )
    (:goal (and
        (on yellow_block orange_block)
        (on green_block purple_block)
        (on purple_block red_block)
        (on red_block blue_block)
        (clear yellow_block)
        (clear green_block)
    ))
)