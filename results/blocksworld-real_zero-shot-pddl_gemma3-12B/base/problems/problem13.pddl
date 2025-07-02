(define (problem blocks-problem)
    (:domain blocksworld)
    (:objects
        blue - block
        yellow - block
        orange - block
        red - block
        purple - block
        green - block
        robot1 - robot
    )
    (:init
        (ontable blue)
        (ontable yellow)
        (ontable orange)
        (ontable red)
        (ontable purple)
        (ontable green)
        (clear blue)
        (clear yellow)
        (clear orange)
        (clear red)
        (clear purple)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on blue yellow)
        (on orange red)
        (on red purple)
        (on purple green)
    ))
)