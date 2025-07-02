(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        purple - block
        red - block
        orange - block
        yellow - block
        robot1 - robot
    )
    (:init
        (on purple green)
        (on red purple)
        (on orange red)
        (on yellow orange)
        (clear yellow)
        (handempty robot1)
    )
    (:goal
        (and
            (on purple green)
            (on red purple)
            (on orange red)
            (on yellow orange)
            (clear yellow)
        )
    )
)