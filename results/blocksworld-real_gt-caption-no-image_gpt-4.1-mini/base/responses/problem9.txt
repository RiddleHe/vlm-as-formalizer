(define (problem blocksworld_stacks)
    (:domain blocksworld)
    (:objects
        red purple orange blue yellow green - block
        robot1 - robot
    )
    (:init
        ; Stack 1: red over purple over orange
        (on red purple)
        (on purple orange)
        (ontable orange)
        (clear red)

        ; Stack 2: blue over yellow over green
        (on blue yellow)
        (on yellow green)
        (ontable green)
        (clear blue)

        ; Robot state
        (handempty robot1)
    )
    (:goal (and
        (on orange blue)
        (ontable blue)

        (on red green)
        (ontable green)

        (on yellow purple)
        (ontable purple)
    ))
)