(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        yellow_block
        green_block
        blue_block
        orange_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable blue_block)
        (ontable red_block)
        (clear purple_block)
        (clear orange_block)
        (clear blue_block)
        (clear red_block)
        (handempty robot1)
        (on yellow_block purple_block)
        (on green_block blue_block)
        (on purple_block yellow_block)
        (on orange_block red_block)
    )
    (:goal (and
        (on green_block red_block)
        (on purple_block blue_block)
        (on yellow_block orange_block)
    ))
)