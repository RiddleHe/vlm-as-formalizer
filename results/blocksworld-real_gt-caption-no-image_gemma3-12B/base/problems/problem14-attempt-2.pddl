(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        green - block
        purple - block
        yellow - block
        blue - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (on orange red)
        (on red green)
        (clear green)
        (ontable purple)
        (on purple yellow)
        (on yellow blue)
        (clear blue)
        (handempty robot1)
    )
    (:goal (and
        (on purple yellow)
        (on yellow orange)
        (on blue red)
        (on red green)
    ))
)