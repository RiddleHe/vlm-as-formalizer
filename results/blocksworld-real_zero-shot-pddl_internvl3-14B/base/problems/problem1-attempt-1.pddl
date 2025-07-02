(define (problem blocksworld-stacks)
    (:domain blocksworld)
    (:objects
        robot1
        orange_block
        yellow_block
        green_block
        blue_block
        red_block
        purple_block
    )
    (:init
        (handempty robot1)
        (clear orange_block)
        (table orange_block)
        (ontable orange_block)
        
        (clear yellow_block)
        (table yellow_block)
        (ontable yellow_block)
        
        (clear green_block)
        (table green_block)
        (ontable green_block)
        
        (clear blue_block)
        (table blue_block)
        (ontable blue_block)
        
        (clear red_block)
        (table red_block)
        (ontable red_block)
        
        (clear purple_block)
        (table purple_block)
        (ontable purple_block)
    )
    (:goal
        (and
            (on orange_block yellow_block)
            
            (on green_block blue_block)
            
            (on red_block purple_block)
        )
    )
)