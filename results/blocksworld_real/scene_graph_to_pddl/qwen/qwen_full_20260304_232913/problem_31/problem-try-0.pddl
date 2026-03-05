(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        green_block
        blue_block
        yellow_block
        red_block
        orange_block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable yellow_block)
        (on red_block yellow_block)
        (on orange_block red_block)
        (clear purple_block)
        (clear green_block)
        (clear blue_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on red_block purple_block)
        (on purple_block yellow_block)
        (on orange_block blue_block)
        (on blue_block green_block)
        (clear red_block)
        (clear orange_block)
    ))
)