(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        yellow_block
        orange_block
        blue_block
        green_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable yellow_block)
        (ontable orange_block)
        (ontable blue_block)
        (ontable green_block)
        (ontable red_block)
        (clear purple_block)
        (clear yellow_block)
        (clear orange_block)
        (clear blue_block)
        (clear green_block)
        (clear red_block)
        (on blue_block orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block purple_block)
        (on purple_block red_block)
        (on red_block yellow_block)
        (on green_block blue_block)
        (clear orange_block)
        (clear green_block)
        (ontable yellow_block)
    ))
)