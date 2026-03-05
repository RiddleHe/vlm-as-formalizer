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
        (on blue_block orange_block)
        (on orange_block green_block)
        (on red_block purple_block)
        (ontable yellow_block)
        (ontable green_block)
        (ontable purple_block)
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
        (ontable red_block)
        (ontable yellow_block)
        (clear green_block)
        (clear blue_block)
    ))
)