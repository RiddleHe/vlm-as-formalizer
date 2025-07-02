(define (problem blocksworld_puzzle)
    (:domain blocksworld)
    
    (:objects
        blue - block
        orange - block
        green - block
        purple - block
        yellow - block
        red - block
        robot1 - robot
    )
    
    (:init
        ; Starting configuration with all blocks on the table and clear
        (ontable blue)
        (clear blue)
        (ontable orange)
        (clear orange)
        (ontable green)
        (clear green)
        (ontable purple)
        (clear purple)
        (ontable yellow)
        (clear yellow)
        (ontable red)
        (clear red)
        
        ; Initial state of the robot (empty-handed)
        (handempty robot1)
    )
    
    (:goal 
        ; Goal is to have a stack of all blocks as defined: blue over orange over green over purple over yellow over red
        (and
            (on blue orange)
            (on orange green)
            (on green purple)
            (on purple yellow)
            (on yellow red)
        )
    )
)