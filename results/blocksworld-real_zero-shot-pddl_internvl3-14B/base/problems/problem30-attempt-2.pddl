(define (problem blocksworld1)
    (:domain blocksworld)
    (:objects
        orange - block, 
        purple - block, 
        green - block, 
        blue - block, 
        yellow - block, 
        red - block, 
        robot1 - robot
    )
    (:init
        ; Initial state is conservatively defined. Blocks could be in any state.
        (clear orange)
        (ontable orange)
        (clear purple)
        (ontable purple)
        (clear green)
        (ontable green)
        (clear blue)
        (ontable blue)
        (clear yellow)
        (ontable yellow)
        (clear red)
        (ontable red)
        (handempty robot1)
    )
    (:goal (and
        (on orange purple)
        (on purple green)
        (on green blue)
        (on blue yellow)
        (on yellow red)
    ))
)