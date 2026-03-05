(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green_block
        red_block
        yellow_block
        orange_block
        purple_block
        blue_block
        robot1 - robot
    )
    (:init
        (ontable blue_block)
        (ontable purple_block)
        (clear green_block)
        (clear blue_block)
        (handempty robot1)
        (on green_block red_block)
        (on red_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block purple_block)
    )
    (:goal (and
        (on blue_block purple_block)
        (on purple_block green_block)
        (on green_block red_block)
        (on red_block yellow_block)
        (on yellow_block orange_block)
    ))
)