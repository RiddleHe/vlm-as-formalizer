(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green_block
        yellow_block
        purple_block
        orange_block
        red_block
        blue_block
        robot1 - robot
    )
    (:init
        (on green_block yellow_block)
        (on yellow_block purple_block)
        (on purple_block orange_block)
        (on orange_block red_block)
        (on red_block blue_block)
        (ontable blue_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block green_block)
        (on orange_block red_block)
        (on blue_block yellow_block)
        (clear purple_block)
        (clear orange_block)
        (clear blue_block)
        (ontable green_block)
        (ontable red_block)
        (ontable yellow_block)
    ))
)