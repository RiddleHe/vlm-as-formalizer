(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        green - block
        red - block
        yellow - block
        blue - block
        orange - block
        purple - block
        robot1 - robot
    )
    (:init
        ; Left stack: green on red, red on yellow, yellow on blue, blue on table
        (on green red)
        (on red yellow)
        (on yellow blue)
        (ontable blue)
        (clear green)

        ; Right stack: purple on orange, orange on table
        (on purple orange)
        (ontable orange)
        (clear purple)

        ; Robot state
        (handempty robot1)
    )
    (:goal (and
        ; Stack 1: orange over green
        (on orange green)
        (ontable green)

        ; Stack 2: red over blue over purple over yellow
        (on red blue)
        (on blue purple)
        (on purple yellow)
        (ontable yellow)
    ))
)