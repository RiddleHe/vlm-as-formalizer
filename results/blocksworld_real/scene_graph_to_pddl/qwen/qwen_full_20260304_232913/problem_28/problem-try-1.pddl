(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green_block
        blue_block
        orange_block
        yellow_block
        red_block
        purple_block
        robot1 - robot
    )
    (:init
        (ontable orange_block)
        (ontable yellow_block)
        (ontable red_block)
        (ontable purple_block)
        (clear green_block)
        (clear yellow_block)
        (clear red_block)
        (clear purple_block)
        (on green_block blue_block)
        (on blue_block orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block yellow_block)
        (on yellow_block green_block)
        (on green_block purple_block)
        (on purple_block red_block)
        (on red_block blue_block)
        (clear orange_block)
        (ontable blue_block)
    ))
)