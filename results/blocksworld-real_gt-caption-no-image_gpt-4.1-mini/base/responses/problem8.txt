(define (problem blocks_stacks)
    (:domain blocksworld)
    (:objects
        green purple blue orange red yellow - block
        robot1 - robot
    )
    (:init
        ; Stack 1: green on table, clear
        (ontable green)
        (clear green)
        ; Stack 2: purple on table, clear
        (ontable purple)
        (clear purple)
        ; Stack 3: blue on orange, orange on table, blue clear
        (on blue orange)
        (ontable orange)
        (clear blue)
        ; Stack 4: red on table, clear
        (ontable red)
        (clear red)
        ; Stack 5: yellow on table, clear
        (ontable yellow)
        (clear yellow)
        ; Robot1 empty-handed
        (handempty robot1)
    )
    (:goal (and
        ; First goal stack: yellow over blue over purple
        (on yellow blue)
        (on blue purple)
        (ontable purple)
        (clear yellow)
        ; Second goal stack: red over orange over green
        (on red orange)
        (on orange green)
        (ontable green)
        (clear red)
    ))
)