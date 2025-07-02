(define (problem blocks_task)
    (:domain blocksworld)
    
    (:objects
        green_block blue_block purple_block orange_block red_block yellow_block - block
        robot1 - robot
    )
    
    (:init
        (ontable green_block)
        (ontable blue_block)
        (ontable purple_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable yellow_block)
        
        (clear green_block)
        (clear blue_block)
        (clear purple_block)
        (clear orange_block)
        (clear red_block)
        (clear yellow_block)
        
        (handempty robot1)
    )
    
    (:goal
        (and
            (on green_block blue_block)
            (on red_block yellow_block)
            (on purple_block orange_block)
        )
    )
)