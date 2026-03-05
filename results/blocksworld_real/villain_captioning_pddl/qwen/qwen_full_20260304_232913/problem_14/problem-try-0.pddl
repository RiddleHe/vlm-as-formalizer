(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        purple - block
        yellow - block
        orange - block
        blue - block
        red - block
        green - block
        robot1 - robot
    )
    (:init
        (on purple yellow)
        (on yellow orange)
        (ontable orange)
        (clear purple)
        (not (clear yellow))
        (not (clear orange))

        (on blue red)
        (on red green)
        (ontable green)
        (clear blue)
        (not (clear red))
        (not (clear green))

        (handempty robot1)
        (not (handfull robot1))
        (not (holding purple))
        (not (holding yellow))
        (not (holding orange))
        (not (holding blue))
        (not (holding red))
        (not (holding green))
    )
    (:goal (and
        (on purple yellow)
        (on yellow orange)
        (ontable orange)
        (on blue red)
        (on red green)
        (ontable green)
    ))
)