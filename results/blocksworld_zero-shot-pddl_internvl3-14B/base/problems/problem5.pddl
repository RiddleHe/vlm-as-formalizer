(define (problem blocksworld-stacking)
    (:domain blocksworld)
    
    (:objects
        yellow - block
        red - block
        blue - block
        orange - block
        green - block
        robot - robot
    )
    (:init
        ; Initialize each block on the table and clear except the bottom block which should be clear if it's the bottom one
        (ontable yellow)
        (ontable red)
        (ontable blue)
        (ontable orange)
        (ontable green)
        
        ; All blocks are clear since no blocks are stacked yet
        (clear yellow)
        (clear red)
        (clear blue)
        (clear orange)
        (clear green)
        
        ; Robot starts with an empty hand
        (handempty robot)
    )
    (:goal
        ; The goal is to create a stack where yellow is on red, red on blue, blue on orange, and orange on green
        (and
            (on yellow red)
            (on red blue)
            (on blue orange)
            (on orange green)
        )
    )
)