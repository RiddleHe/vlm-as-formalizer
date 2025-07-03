(define (problem blocksworld_stacks)
    (:domain blocksworld)
    (:objects
        blue green red purple orange yellow - block
        robot1 - robot
    )
    (:init
        ; Initial stacks:
        ; Stack 1: blue
        (ontable blue)
        (clear blue)
        ; Stack 2: green
        (ontable green)
        (clear green)
        ; Stack 3: red
        (ontable red)
        (clear red)
        ; Stack 4: purple over orange over yellow
        (on purple orange)
        (on orange yellow)
        (ontable yellow)
        (clear purple)
        ; Robot initial state
        (handempty robot1)
    )
    (:goal (and
        ; Goal stacks:
        ; Stack A: yellow over orange over red over purple
        (on yellow orange)
        (on orange red)
        (on red purple)
        (ontable purple)
        (clear yellow)
        ; Stack B: blue over green
        (on blue green)
        (ontable green)
        (clear blue)
    ))
)