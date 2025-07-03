(define (problem blocks_stacking)
    (:domain blocksworld)
    (:objects
        purple yellow blue red green orange - block
        robot1 - robot
    )
    (:init
        ; Stack 1: purple over yellow
        (on purple yellow)
        (ontable yellow)
        (clear purple)
        (handempty robot1)
        
        ; Stack 2: blue over red over green
        (on blue red)
        (on red green)
        (ontable green)
        (clear blue)
        
        ; Stack 3: orange
        (ontable orange)
        (clear orange)
    )
    (:goal (and
        (on green blue)
        (on blue purple)
        (on purple orange)
        (ontable orange)
        (on red yellow)
        (ontable yellow)
        (clear red)
    ))
)