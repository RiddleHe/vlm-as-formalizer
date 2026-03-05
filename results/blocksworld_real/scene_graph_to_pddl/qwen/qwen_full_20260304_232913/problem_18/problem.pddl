(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block
        orange_block
        green_block
        yellow_block
        blue_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable orange_block)
        (ontable green_block)
        (ontable yellow_block)
        (ontable blue_block)
        (ontable red_block)
        (clear purple_block)
        (clear orange_block)
        (clear green_block)
        (clear yellow_block)
        (clear blue_block)
        (clear red_block)
        (handempty robot1)
        (on purple_block orange_block)
        (on yellow_block orange_block)
        (on blue_block yellow_block)
    )
    (:goal (and
        (on green_block purple_block)
        (on purple_block orange_block)
        (on orange_block yellow_block)
        (on yellow_block blue_block)
        (on blue_block red_block)
        (ontable red_block)
        (clear green_block)
    ))
)