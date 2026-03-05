(define (problem blocksworld_task)
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
        (on orange_block red_block)
        (on purple_block orange_block)
        (on pink_block purple_block)
        (on yellow_block pink_block)
        (on green_block yellow_block)
        (ontable green_block)
        (clear red_block)
        (handempty robot1)
    )
    (:goal (and
        (on yellow_block pink_block)
        (on green_block yellow_block)
        (ontable pink_block)
        (clear pink_block)
        (on orange_block red_block)
        (on purple_block orange_block)
        (ontable red_block)
        (clear red_block)
    ))
)