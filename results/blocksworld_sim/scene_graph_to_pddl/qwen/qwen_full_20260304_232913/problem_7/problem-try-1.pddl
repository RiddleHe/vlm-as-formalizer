(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow_block
        pink_block
        green_block
        red_block
        purple_block
        orange_block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable purple_block)
        (ontable orange_block)
        (clear yellow_block)
        (clear red_block)
        (clear orange_block)
        (handempty robot1)
        (on yellow_block pink_block)
        (on pink_block green_block)
        (on red_block purple_block)
    )
    (:goal (and
        (on yellow_block pink_block)
        (on pink_block green_block)
        (on green_block red_block)
        (on red_block purple_block)
        (on purple_block blue_block)
        (ontable blue_block)
        (clear yellow_block)
    ))
)