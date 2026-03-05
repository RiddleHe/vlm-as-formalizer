(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        red_block
        orange_block
        yellow_block
        green_block
        blue_block
        purple_block
        robot1 - robot
    )
    (:init
        (ontable red_block)
        (ontable orange_block)
        (ontable blue_block)
        (ontable purple_block)
        (ontable green_block)
        (clear red_block)
        (clear orange_block)
        (clear blue_block)
        (clear purple_block)
        (clear yellow_block)
        (handempty robot1)
        (on yellow_block green_block)
    )
    (:goal (and
        (on yellow_block orange_block)
        (on orange_block purple_block)
        (on purple_block green_block)
        (on green_block blue_block)
        (on blue_block red_block)
        (clear yellow_block)
        (ontable red_block)
    ))
)