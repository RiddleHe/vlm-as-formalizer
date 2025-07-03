(define (problem blocksworld_problem1)
    (:domain blocksworld)
    (:objects
        green blue orange yellow red purple - block
        robot1 - robot
    )
    (:init
        ;; Stack 1: green over blue over orange
        (on green blue)
        (on blue orange)
        (clear green)
        (ontable orange)

        ;; Stack 2: yellow
        (clear yellow)
        (ontable yellow)

        ;; Stack 3: red
        (clear red)
        (ontable red)

        ;; Stack 4: purple
        (clear purple)
        (ontable purple)

        ;; Robot state
        (handempty robot1)
    )
    (:goal (and
        (on orange yellow)
        (on yellow green)
        (on green purple)
        (on purple red)
        (on red blue)
    ))
)