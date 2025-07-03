(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects 
        green red yellow purple orange blue - block
        robot1 - robot
    )
    (:init
        ; Stack 1: green on table, clear
        (ontable green)
        (clear green)

        ; Stack 2: red over yellow
        (on red yellow)
        (clear red)
        (ontable yellow)

        ; Stack 3: purple over orange over blue
        (on purple orange)
        (on orange blue)
        (clear purple)
        (ontable blue)

        ; Robot
        (handempty robot1)
    )
    (:goal (and 
        (on green red)
        (on red orange)
        (on orange purple)
        (on purple blue)
        (on blue yellow)
    ))
)