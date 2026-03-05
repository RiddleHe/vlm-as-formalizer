(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        yellow_block
        blue_block
        green_block
        orange_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable yellow_block)
        (ontable blue_block)
        (ontable orange_block)
        (clear purple_block)
        (clear yellow_block)
        (clear blue_block)
        (clear green_block)
        (clear orange_block)
        (on green_block orange_block)
        (on red_block orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on blue_block orange_block)
        (on purple_block green_block)
        (on yellow_block red_block)
    ))
)