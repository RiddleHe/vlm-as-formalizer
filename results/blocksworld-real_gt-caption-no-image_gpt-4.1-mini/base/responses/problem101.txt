(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green blue yellow purple orange red - block
        robot1 - robot
    )
    (:init
        ; Stack 1: green over blue
        (on green blue)
        (clear green)
        (ontable blue)

        ; Stack 2: yellow over purple
        (on yellow purple)
        (clear yellow)
        (ontable purple)

        ; Stack 3: orange over red
        (on orange red)
        (clear orange)
        (ontable red)

        (handempty robot1)
    )
    (:goal (and
        (on yellow orange)
        (on red green)
        (on blue purple)
    ))
)