(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block - block
        pink_block - block
        yellow_block - block
        orange_block - block
        red_block - block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable pink_block)
        (ontable yellow_block)
        (ontable orange_block)
        (ontable red_block)
        (clear purple_block)
        (clear pink_block)
        (clear yellow_block)
        (clear orange_block)
        (clear red_block)
        (handempty robot1)
    )
    (:goal (and
        (on pink_block purple_block)
        (on yellow_block orange_block)
    ))
)