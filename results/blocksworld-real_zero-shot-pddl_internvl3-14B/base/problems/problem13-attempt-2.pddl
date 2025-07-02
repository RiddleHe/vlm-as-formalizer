(define (problem block_swapping)
    (:domain blocksworld)
    (:objects 
        green_block orange_block red_block purple_block blue_block yellow_block - block
        robot1 - robot
    )
    (:init
        (on green_block yellow_block)
        (on yellow_block orange_block)
        (clear green_block)
        (handempty robot1)
        (ontable blue_block)
        (clear blue_block)
        (clear red_block)
        (clear purple_block)
        (ontable red_block)
        (ontable purple_block)
    )
    (:goal 
        (and 
            (on blue_block yellow_block)
            (on orange_block red_block)
            (on red_block purple_block)
            (on green_block blue_block)
        )
    )
)