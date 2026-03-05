(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow_block
        red_block
        green_block
        purple_block
        orange_block
        blue_block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (ontable red_block)
        (ontable green_block)
        (ontable blue_block)
        (on orange_block blue_block)
        (on purple_block orange_block)
        (clear yellow_block)
        (clear red_block)
        (clear green_block)
        (clear purple_block)
        (clear orange_block)
        (clear blue_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block blue_block)
        (on blue_block purple_block)
        (on yellow_block orange_block)
        (on orange_block red_block)
        (clear green_block)
        (clear yellow_block)
        (ontable purple_block)
        (ontable red_block)
    ))
)