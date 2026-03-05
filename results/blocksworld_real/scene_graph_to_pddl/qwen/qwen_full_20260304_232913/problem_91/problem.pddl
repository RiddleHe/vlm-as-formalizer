(define (problem blocksworld_stack)
    (:domain blocksworld)
    (:objects
        green_block
        blue_block
        purple_block
        yellow_block
        orange_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable purple_block)
        (ontable yellow_block)
        (ontable orange_block)
        (ontable red_block)
        (clear green_block)
        (clear purple_block)
        (clear yellow_block)
        (clear orange_block)
        (clear red_block)
        (handempty robot1)
        (on green_block blue_block)
        (on yellow_block orange_block)
    )
    (:goal (and
        (on orange_block purple_block)
        (on purple_block red_block)
        (on red_block yellow_block)
        (on yellow_block green_block)
        (on green_block blue_block)
        (clear orange_block)
        (ontable blue_block)
    ))
)