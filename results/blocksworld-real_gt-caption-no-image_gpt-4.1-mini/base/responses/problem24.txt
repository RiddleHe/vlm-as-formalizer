(define (problem blocks_stacking)
    (:domain blocksworld)
    (:objects
        orange purple green blue yellow red - block
        robot1 - robot
    )
    (:init
        ; Stack 1: orange on table, clear
        (ontable orange)
        (clear orange)

        ; Stack 2: purple over green over blue on table
        (on purple green)
        (on green blue)
        (ontable blue)
        (clear purple)

        ; Stack 3: yellow over red on table
        (on yellow red)
        (ontable red)
        (clear yellow)

        ; Robot state
        (handempty robot1)
    )
    (:goal (and
        (on blue orange)
        (on orange green)
        (on green purple)
        (on purple red)
        (on red yellow)
    ))
)