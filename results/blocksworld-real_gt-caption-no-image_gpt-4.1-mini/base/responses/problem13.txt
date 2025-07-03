(define (problem blocks_stacking)
    (:domain blocksworld)
    (:objects
        blue purple yellow red orange green - block
        robot1 - robot
    )
    (:init
        ; Stack 1: blue over purple over yellow
        (on blue purple)
        (on purple yellow)
        (ontable yellow)
        (clear blue)

        ; Stack 2: green over red over orange
        (on green red)
        (on red orange)
        (ontable orange)
        (clear green)

        ; Robot state
        (handempty robot1)
    )
    (:goal (and
        ; Stack 1 goal: blue over yellow (directly)
        (on blue yellow)
        (ontable yellow)
        (clear blue)

        ; Stack 2 goal: orange over red over purple over green
        (on orange red)
        (on red purple)
        (on purple green)
        (ontable green)
        (clear orange)
    ))
)