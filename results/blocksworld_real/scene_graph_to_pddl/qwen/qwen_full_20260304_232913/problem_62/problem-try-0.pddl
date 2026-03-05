(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange_block
        green_block
        blue_block
        purple_block
        red_block
        yellow_block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable purple_block)
        (ontable yellow_block)
        (clear orange_block)
        (clear blue_block)
        (clear red_block)
        (handempty robot1)
        (on orange_block green_block)
        (on blue_block purple_block)
        (on red_block yellow_block)
    )
    (:goal (and
        (on blue_block yellow_block)
        (on yellow_block orange_block)
        (on green_block red_block)
        (on red_block purple_block)
        (clear blue_block)
        (clear green_block)
        (ontable orange_block)
        (ontable purple_block)
    ))
)