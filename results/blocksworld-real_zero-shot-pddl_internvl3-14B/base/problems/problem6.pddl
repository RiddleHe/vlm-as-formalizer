(define (problem blockstack)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        blue - block
        orange - block
        red - block
        purple - block
        yellow - block
    )
    (:init
        (clear blue)
        (on blue purple)
        (clear orange)
        (ontable orange)
        (clear red)
        (ontable red)
        (clear purple)
        (ontable purple)
        (clear yellow)
        (ontable yellow)
        (handempty robot1)
    )
    (:goal
        (and
            (on blue orange)
            (on orange red)
            (on red purple)
            (on purple yellow)
        )
    )
)