(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        blue_block
        green_block
        orange_block
        yellow_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable orange_block)
        (ontable yellow_block)
        (ontable red_block)
        (clear purple_block)
        (clear orange_block)
        (clear yellow_block)
        (clear red_block)
        (handempty robot1)
        (on purple_block blue_block)
        (on blue_block green_block)
        (on green_block red_block)
    )
    (:goal (and
        (on blue_block orange_block)
        (on orange_block green_block)
        (on green_block purple_block)
        (on purple_block red_block)
        (on red_block yellow_block)
        (ontable yellow_block)
        (clear blue_block)
    ))
)