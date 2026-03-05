(define (problem blocksworld_stack)
    (:domain blocksworld)
    (:objects
        green_block
        purple_block
        yellow_block
        orange_block
        blue_block
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
        (clear blue_block)
        (on blue_block red_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block purple_block)
        (on purple_block red_block)
        (on red_block blue_block)
        (on blue_block yellow_block)
        (on yellow_block orange_block)
        (ontable orange_block)
        (clear green_block)
    ))
)