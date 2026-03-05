(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange_block
        yellow_block
        green_block
        blue_block
        red_block
        purple_block
        robot1 - robot
    )
    (:init
        (ontable orange_block)
        (ontable yellow_block)
        (ontable red_block)
        (ontable purple_block)
        (clear orange_block)
        (clear yellow_block)
        (clear red_block)
        (clear purple_block)
        (clear green_block)
        (clear blue_block)
        (handempty robot1)
        (on blue_block green_block)
        (on green_block yellow_block)
        (on purple_block red_block)
    )
    (:goal (and
        (on yellow_block blue_block)
        (on red_block orange_block)
        (on orange_block green_block)
        (on green_block purple_block)
        (clear yellow_block)
        (clear red_block)
        (ontable purple_block)
    ))
)