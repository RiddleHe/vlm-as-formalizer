(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        yellow - block
        red - block
        green - block
        purple - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable green)
        (ontable purple)
        (clear orange)
        (clear green)
        (clear purple)
        (handempty robot1)
        (on blue orange)
        (on yellow red)
        (on red green)
    )
    (:goal (and
        (on orange red)
        (on red yellow)
        (on blue purple)
        (on purple green)
        (not (on blue orange))
        (not (on yellow red))
        (not (on red green))
    ))
)