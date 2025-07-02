(define (problem blocksworld-stacking-tower)
    (:domain blocksworld)
    (:objects
        red_block blue_block green_block yellow_block orange_block purple_block - block
        robot1 - robot
    )
    (:init
        (on blue_block red_block)
        (on green_block blue_block)
        (on yellow_block green_block)
        (on purple_block yellow_block)
        (ontable orange_block)
        (clear red_block)
        (handempty robot1)
    )
    (:goal
        (and 
            (ontable red_block)
            (on blue_block red_block)
            (on green_block blue_block)
            (on yellow_block green_block)
            (on purple_block yellow_block)
            (on orange_block red_block)
            (clear orange_block)
        )
    )
)