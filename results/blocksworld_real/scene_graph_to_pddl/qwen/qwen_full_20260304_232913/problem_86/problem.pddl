(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        red_block
        green_block
        blue_block
        yellow_block
        orange_block
        purple_block
        robot1 - robot
    )
    (:init
        (ontable blue_block)
        (ontable purple_block)
        (ontable orange_block)
        (ontable green_block)
        (clear red_block)
        (clear yellow_block)
        (clear blue_block)
        (clear purple_block)
        (on red_block green_block)
        (on yellow_block orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block orange_block)
        (on orange_block purple_block)
        (on purple_block blue_block)
        (on yellow_block red_block)
        (clear green_block)
        (clear yellow_block)
        (ontable blue_block)
    ))
)