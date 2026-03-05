(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow_block
        orange_block
        red_block
        blue_block
        purple_block
        green_block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable green_block)
        (ontable red_block)
        (ontable blue_block)
        (clear yellow_block)
        (clear orange_block)
        (clear purple_block)
        (clear green_block)
        (on yellow_block red_block)
        (on orange_block blue_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block blue_block)
        (on orange_block red_block)
        (on yellow_block purple_block)
    ))
)