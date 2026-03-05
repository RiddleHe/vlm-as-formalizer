(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow_block - block
        red_block - block
        orange_block - block
        blue_block - block
        purple_block - block
        green_block - block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (ontable red_block)
        (ontable orange_block)
        (ontable blue_block)
        (ontable purple_block)
        (ontable green_block)
        (clear yellow_block)
        (clear red_block)
        (clear orange_block)
        (clear blue_block)
        (clear purple_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block blue_block)
        (on orange_block red_block)
        (on yellow_block purple_block)
    ))
)