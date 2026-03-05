(define (problem block_stack_goal)
    (:domain blocksworld)
    (:objects
        red_block
        orange_block
        yellow_block
        green_block
        blue_block
        purple_block
        robot1
    )
    (:init
        (ontable red_block)
        (ontable orange_block)
        (ontable yellow_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable purple_block)
        (clear red_block)
        (clear orange_block)
        (clear yellow_block)
        (clear green_block)
        (clear blue_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block purple_block)
        (on purple_block orange_block)
        (on orange_block yellow_block)
        (on yellow_block blue_block)
        (on blue_block red_block)
        (clear green_block)
    ))
)