(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        blue_block
        orange_block
        green_block
        red_block
        purple_block
        yellow_block
        robot1 - robot
    )
    (:init
        (on orange_block green_block)
        (on blue_block orange_block)
        (on red_block purple_block)
        (ontable yellow_block)
        (ontable purple_block)
        (ontable green_block)
        (clear blue_block)
        (clear red_block)
        (clear yellow_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block red_block)
        (on blue_block orange_block)
        (on orange_block purple_block)
        (on purple_block yellow_block)
        (clear blue_block)
        (ontable yellow_block)
    ))
)