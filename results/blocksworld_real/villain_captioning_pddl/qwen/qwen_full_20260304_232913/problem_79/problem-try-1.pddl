(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        orange - block
        purple - block
        yellow - block
        robot1 - robot
    )
    (:init
        (on green orange)
        (ontable orange)
        (ontable blue)
        (ontable purple)
        (ontable yellow)
        (clear green)
        (clear blue)
        (clear purple)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on blue orange)
        (on purple green)
        (on yellow red)
    ))
)