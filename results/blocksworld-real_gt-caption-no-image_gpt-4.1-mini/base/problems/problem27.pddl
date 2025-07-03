(define (problem stack_combination)
    (:domain blocksworld)
    (:objects
        purple yellow blue red green orange - block
        robot1 - robot
    )
    (:init
        ; Stack 1: purple
        (ontable purple)
        (clear purple)
        ; Stack 2: yellow over blue
        (on yellow blue)
        (ontable blue)
        (clear yellow)
        ; Stack 3: red
        (ontable red)
        (clear red)
        ; Stack 4: green
        (ontable green)
        (clear green)
        ; Stack 5: orange
        (ontable orange)
        (clear orange)

        ; Robot state
        (handempty robot1)
    )
    (:goal (and
        (on blue green)
        (on green red)
        (on red yellow)
        (on yellow orange)
        (on orange purple)
    ))
)