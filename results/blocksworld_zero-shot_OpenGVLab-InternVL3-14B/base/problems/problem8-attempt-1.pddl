(define (problem blockstacking)
    (:domain blocksworld)
    (:objects 
        robot1 
        red_block orange_block purple_block 
        pink_block yellow_block green_block 
    )
    (:init
        (clear red_block)
        (clear orange_block)
        (clear purple_block)
        (clear pink_block)
        (clear yellow_block)
        (clear green_block)
        (handempty robot1)
        (ontable red_block)
        (ontable orange_block)
        (ontable purple_block)
        (ontable pink_block)
        (ontable yellow_block)
        (ontable green_block)
    )
    (:goal
        (and 
            (on green_block yellow_block)
            (on yellow_block pink_block)
            (on pink_block (not pink_block))
            (on purple_block orange_block)
            (on orange_block red_block)
            (not (ontable green_block))
            (not (ontable yellow_block))
            (not (ontable pink_block))
            (not (ontable purple_block))
            (not (ontable orange_block))
            (not (ontable red_block))
        )
    )
)