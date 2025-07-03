(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        red blue orange green purple yellow - block
    )
    (:init
        ;; Robot state
        (handempty robot1)

        ;; Initial stacks
        ;; Stack 1: red (on table)
        (ontable red)
        (clear red)

        ;; Stack 2: blue over orange over green over purple over yellow (bottom)
        (ontable yellow)
        (on purple yellow)
        (on green purple)
        (on orange green)
        (on blue orange)
        (clear blue)
    )
    (:goal (and 
        ;; First stack: orange over purple over blue
        (on orange purple)
        (on purple blue)
        (clear orange)
        (ontable blue)

        ;; Second stack: yellow over red over green
        (on yellow red)
        (on red green)
        (clear yellow)
        (ontable green)
    ))
)