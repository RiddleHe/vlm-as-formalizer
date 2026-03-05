(define (problem blocksworld_split_stacks)
    (:domain blocksworld)
    (:objects
        red_block
        orange_block
        purple_block
        pink_block
        yellow_block
        green_block
        robot1 - robot
    )
    (:init
        (on red_block orange_block)
        (on orange_block purple_block)
        (on purple_block pink_block)
        (on pink_block yellow_block)
        (on yellow_block green_block)
        (ontable green_block)
        (clear red_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block yellow_block)
        (on yellow_block pink_block)
        (ontable pink_block)
        (on purple_block orange_block)
        (on orange_block red_block)
        (ontable red_block)
        (clear green_block)
        (clear purple_block)
    ))
)