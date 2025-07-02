(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        orange red yellow blue green purple - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable red)
        (ontable yellow)
        (ontable blue)
        (ontable green)
        (ontable purple)
        (clear orange)
        (clear red)
        (clear yellow)
        (clear blue)
        (clear green)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on orange purple)
        (on purple green)
        (on green blue)
        (on blue yellow)
        (on yellow red)
    ))
)