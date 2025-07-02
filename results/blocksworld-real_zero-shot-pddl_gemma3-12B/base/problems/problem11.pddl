(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        orange - block
        purple - block
        blue - block
        green - block
        red - block
        yellow - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable orange)
        (ontable purple)
        (ontable blue)
        (ontable green)
        (ontable red)
        (ontable yellow)
        (clear orange)
        (clear purple)
        (clear blue)
        (clear green)
        (clear red)
        (clear yellow)
    )
    (:goal (and
        (on green blue)
        (on blue purple)
        (on purple orange)
        (on red yellow)
    ))
)