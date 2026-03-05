(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        blue_block
        orange_block
        yellow_block
        green_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable yellow_block)
        (ontable green_block)
        (ontable orange_block)
        (ontable blue_block)
        (clear purple_block)
        (clear yellow_block)
        (clear green_block)
        (clear orange_block)
        (clear blue_block)
        (on red_block blue_block)
        (clear red_block)
        (handempty robot1)
    )
    (:goal (and
        (on red_block green_block)
        (on yellow_block purple_block)
        (on blue_block orange_block)
    ))
)