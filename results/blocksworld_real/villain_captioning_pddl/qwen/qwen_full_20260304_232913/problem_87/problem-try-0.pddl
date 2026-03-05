(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        purple yellow green blue orange red
        robot1
    )
    (:init
        (on purple yellow)
        (on yellow green)
        (on green blue)
        (on orange red)
        (ontable blue)
        (ontable red)
        (clear purple)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on green red)
        (on purple blue)
        (on yellow orange)
        (ontable red)
        (ontable blue)
        (ontable orange)
        (clear green)
        (clear purple)
        (clear yellow)
    ))
)