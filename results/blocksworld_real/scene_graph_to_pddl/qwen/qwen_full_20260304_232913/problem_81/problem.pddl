(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow_block
        purple_block
        blue_block
        green_block
        red_block
        orange_block
        robot1 - robot
    )
    (:init
        (on yellow_block purple_block)
        (on purple_block blue_block)
        (on blue_block green_block)
        (on green_block red_block)
        (ontable red_block)
        (ontable orange_block)
        (clear yellow_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block red_block)
        (on purple_block yellow_block)
        (on blue_block orange_block)
    ))
)