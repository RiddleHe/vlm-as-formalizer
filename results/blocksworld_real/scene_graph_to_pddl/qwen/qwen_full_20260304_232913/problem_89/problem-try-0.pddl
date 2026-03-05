(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow_block
        blue_block
        green_block
        purple_block
        orange_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (ontable red_block)
        (ontable orange_block)
        (on blue_block yellow_block)
        (on purple_block orange_block)
        (on green_block purple_block)
        (clear yellow_block)
        (clear red_block)
        (clear green_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block green_block)
        (on green_block blue_block)
        (on blue_block yellow_block)
        (on orange_block red_block)
        (clear purple_block)
        (clear orange_block)
        (ontable yellow_block)
        (ontable red_block)
    ))
)