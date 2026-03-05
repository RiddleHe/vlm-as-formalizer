(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block - block
        blue_block - block
        red_block - block
        green_block - block
        orange_block - block
        yellow_block - block
        robot1 - robot
    )
    (:init
        (on purple_block blue_block)
        (on blue_block red_block)
        (ontable red_block)
        (ontable green_block)
        (on orange_block yellow_block)
        (ontable yellow_block)
        (clear purple_block)
        (clear green_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on red_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block green_block)
        (on green_block purple_block)
        (on purple_block blue_block)
        (ontable blue_block)
    ))
)