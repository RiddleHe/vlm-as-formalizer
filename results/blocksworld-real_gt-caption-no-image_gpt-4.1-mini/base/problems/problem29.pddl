(define (problem blocks_stacking)
    (:domain blocksworld)
    (:objects
        yellow purple orange green red blue - block
        robot1 - robot
    )
    (:init
        ; Stack 1: yellow on table, clear
        (ontable yellow)
        (clear yellow)
        ; Stack 2: purple on table, clear
        (ontable purple)
        (clear purple)
        ; Stack 3: orange on green, green on red, red on table, clear orange
        (on orange green)
        (on green red)
        (ontable red)
        (clear orange)
        ; Stack 4: blue on table, clear
        (ontable blue)
        (clear blue)
        ; Robot empty-handed
        (handempty robot1)
    )
    (:goal
        (and
            (on blue orange)
            (on orange green)
            (on green purple)
            (on purple red)
            (on red yellow)
        )
    )
)