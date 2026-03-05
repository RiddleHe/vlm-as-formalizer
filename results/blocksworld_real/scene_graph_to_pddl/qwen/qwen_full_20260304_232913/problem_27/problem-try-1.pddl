(define (problem blocksworld_stack)
    (:domain blocksworld)
    (:objects
        orange_block
        green_block
        blue_block
        yellow_block
        red_block
        purple_block
        robot1 - robot
    )
    (:init
        (ontable orange_block)
        (ontable green_block)
        (ontable red_block)
        (ontable purple_block)
        (on yellow_block blue_block)
        (clear orange_block)
        (clear green_block)
        (clear red_block)
        (clear purple_block)
        (clear blue_block)
        (clear yellow_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block orange_block)
        (on orange_block red_block)
        (on red_block green_block)
        (on green_block blue_block)
        (on blue_block yellow_block)
        (clear purple_block)
        (ontable yellow_block)
    ))
)