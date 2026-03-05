(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green_block
        orange_block
        red_block
        yellow_block
        blue_block
        purple_block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable blue_block)
        (clear green_block)
        (clear orange_block)
        (clear red_block)
        (clear blue_block)
        (clear purple_block)
        (clear yellow_block)
        (handempty robot1)
        (on yellow_block red_block)
        (on purple_block blue_block)
    )
    (:goal (and
        (on purple_block red_block)
        (on red_block blue_block)
        (on blue_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block green_block)
        (clear purple_block)
        (ontable green_block)
    ))
)