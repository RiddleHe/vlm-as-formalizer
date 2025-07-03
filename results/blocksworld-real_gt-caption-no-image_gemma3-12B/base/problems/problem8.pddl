(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        green - block
        purple - block
        blue - block
        orange - block
        red - block
        yellow - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable green)
        (ontable purple)
        (ontable blue)
        (ontable orange)
        (ontable red)
        (ontable yellow)
        (clear green)
        (clear purple)
        (clear blue)
        (clear orange)
        (clear red)
        (clear yellow)
        (on green orange)
        (on purple blue)
        (on blue red)
        (on red yellow)
    )
    (:goal (and
        (on yellow blue)
        (on blue purple)
        (on purple green)
        (on red orange)
    ))
)