(define (problem blocksworld_stacks)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        orange red green purple yellow blue - block
    )
    (:init
        ; robot state
        (handempty robot1)

        ; stack 1: orange over red over green
        (on orange red)
        (on red green)
        (ontable green)
        (clear orange)

        ; stack 2: purple over yellow over blue
        (on purple yellow)
        (on yellow blue)
        (ontable blue)
        (clear purple)
    )
    (:goal (and
        ; stack a: purple over yellow over orange
        (on purple yellow)
        (on yellow orange)
        (ontable orange)
        (clear purple)

        ; stack b: blue over red over green
        (on blue red)
        (on red green)
        (ontable green)
        (clear blue)
    ))
)