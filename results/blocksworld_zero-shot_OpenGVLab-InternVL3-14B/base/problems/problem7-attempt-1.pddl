(define (problem block_stack)
    (:domain blocksworld)
    (:objects
        robot - robot
        yellow_block - block
        pink_block - block
        green_block - block
        red_block - block
        purple_block - block
        blue_block - block
    )
    (:init
        (ontable yellow_block)
        (ontable pink_block)
        (ontable green_block)
        (ontable red_block)
        (ontable purple_block)
        (clear yellow_block)
        (clear pink_block)
        (clear green_block)
        (clear red_block)
        (clear purple_block)
        (handempty robot)
        (not (ontable blue_block))
    )
    (:goal
        (and
            (on yellow_block pink_block)
            (on pink_block green_block)
            (on green_block red_block)
            (on red_block purple_block)
            (on purple_block blue_block)
        )
    )
)