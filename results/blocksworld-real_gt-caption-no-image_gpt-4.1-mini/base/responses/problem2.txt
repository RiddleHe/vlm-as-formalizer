(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange blue purple red yellow green - block
        robot1 - robot
    )
    (:init
        ; Stack 1: orange over blue over purple over red
        (on orange blue)
        (on blue purple)
        (on purple red)
        (ontable red)
        (clear orange)

        ; Stack 2: green over yellow
        (on green yellow)
        (ontable yellow)
        (clear green)

        ; Robot initial state
        (handempty robot1)
    )
    (:goal
        (and
            (on green red)
            (on red purple)
            (on purple blue)
            (on blue orange)
            (on orange yellow)
        )
    )
)