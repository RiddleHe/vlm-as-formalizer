(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        red block
        orange block
        purple block
        blue block
        yellow block
        green block
        robot1 robot
    )
    (:init
        (yellow clear)
        (green clear)
        (ontable yellow)
        (ontable green)
        (clear blue)
        (ontable blue)
        (on red blue)
        (clear orange)
        (on blue purple)
        (on purple orange)
        (handempty robot1)
    )
    (:goal 
        (and 
            (on yellow blue)
            (on blue purple)
            (on purple orange)
            (on orange green)
            (on green red)
        )
    )
)