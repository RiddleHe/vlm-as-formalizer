(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        yellow orange red blue green purple - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable orange)
        (ontable red)
        (ontable blue)
        (clear yellow)
        (clear orange)
        (clear red)
        (clear blue)
        (handempty robot1)
    )
    (:goal (and
        (on green orange)
        (on purple yellow)
        (on red blue)
    ))
)