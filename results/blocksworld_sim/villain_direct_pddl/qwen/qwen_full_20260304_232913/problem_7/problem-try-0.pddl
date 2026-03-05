(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow_block - block
        pink_block - block
        green_block - block
        red_block - block
        purple_block - block
        orange_block - block
        robot1 - robot
    )
    (:init
        (on yellow_block pink_block)
        (on pink_block green_block)
        (on red_block purple_block)
        (ontable green_block)
        (ontable purple_block)
        (ontable orange_block)
        (clear yellow_block)
        (clear red_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on yellow_block pink_block)
        (on pink_block green_block)
        (on green_block red_block)
        (on red_block purple_block)
        (on purple_block blue_block)  ; Note: blue_block is not present in the image, so this goal is unachievable as stated.
    ))
)