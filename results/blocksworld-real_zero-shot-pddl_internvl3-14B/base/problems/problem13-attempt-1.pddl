(define (problem block_swapping)
    (:domain blocksworld)
    (:objects 
        green_block orange_block red_block purple_block blue_block yellow_block - block
        robot1 - robot
    )
    (:init
        (clear green_block)
        (clear orange_block)
        (clear blue_block)
        (clear red_block)
        (clear purple_block)
        (clear yellow_block)
        (ontable green_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable purple_block)
        (ontable blue_block)
        (ontable yellow_block)
        (handempty robot1)
    )
    (:goal 
        (and 
            (on blue_block yellow_block)
            (on green_block orange_block)
            (on orange_block red_block)
            (on red_block purple_block)
            (on purple_block green_block)
        )
    )
)