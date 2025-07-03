(define (problem blocksworld4)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        red - block
        purple - block
        orange - block
        yellow - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable blue)
        (ontable green)
        (ontable red)
        (ontable purple)
        (ontable orange)
        (ontable yellow)
        (clear blue)
        (clear green)
        (clear red)
        (clear purple)
        (clear orange)
        (clear yellow)
        (on purple orange)
        (on orange yellow)
    )
    (:goal
        (and
            (on yellow orange)
            (on orange red)
            (on red purple)
            (on purple blue)
            (on blue green)
        )
    )
)