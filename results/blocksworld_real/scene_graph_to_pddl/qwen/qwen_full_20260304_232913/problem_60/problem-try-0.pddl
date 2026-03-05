(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        yellow_block
        blue_block
        orange_block
        red_block
        green_block
        robot1 - robot
    )
    (:init
        (ontable orange_block)
        (ontable red_block)
        (clear purple_block)
        (clear red_block)
        (clear orange_block)
        (handempty robot1)
        (on yellow_block blue_block)
        (on blue_block orange_block)
        (on purple_block yellow_block)
    )
    (:goal (and
        (on red_block green_block)
        (ontable green_block)
        (clear red_block)
        (on orange_block blue_block)
        (on blue_block purple_block)
        (on purple_block yellow_block)
        (ontable yellow_block)
        (clear orange_block)
    ))
)