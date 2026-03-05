(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        orange_block
        green_block
        red_block
        purple_block
        yellow_block
        blue_block
        robotic_arm
    )
    (:init
        (ontable red_block)
        (on orange_block green_block)
        (on green_block red_block)
        (on purple_block yellow_block)
        (on yellow_block blue_block)
        (clear orange_block)
        (handempty robotic_arm)
    )
    (:goal (and
        (on blue_block orange_block)
        (on orange_block green_block)
        (on green_block purple_block)
        (on purple_block yellow_block)
        (on yellow_block red_block)
        (ontable red_block)
    ))
)