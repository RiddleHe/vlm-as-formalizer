(define (problem blockstack)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        blue - block
        orange - block
        red - block
        purple - block
        green - block
        yellow - block
    )
    (:init
        (clear blue)
        (on blue orange)
        (on orange red)
        (on red purple)
        (on purple green)
        (ontable green)
        (clear yellow)
        (ontable yellow)
        (handempty robot1)
    )
    (:goal
        (and
            (on blue orange)
            (on orange red)
            (on red purple)
            (on purple green)
            (on green yellow)
            (clear blue)
            (clear yellow)
        )
    )
)