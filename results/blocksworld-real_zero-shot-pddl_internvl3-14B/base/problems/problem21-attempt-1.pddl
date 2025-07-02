(define (problem blockstack)
    (:domain blocksworld)
    (:objects
        robot1
        blue - block
        yellow - block
        green - block
        red - block
        orange - block
        purple - block
    )
    (:init
        (holding robot1 blue)
        (clear yellow)
        (on yellow purple)
        (clear green)
        (on green red)
        (clear orange)
        (on orange purple)
        (handempty robot1)
        (not (handfull robot1))
        (not (holding robot1 green))
        (not (holding robot1 red))
        (not (holding robot1 orange))
    )
    (:goal
        (and
            (on green red)
            (on orange purple)
            (on blue yellow)
        )
    )
)