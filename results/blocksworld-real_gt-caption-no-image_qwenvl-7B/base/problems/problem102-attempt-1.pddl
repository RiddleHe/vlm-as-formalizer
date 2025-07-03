(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        green - block
        red - block
        blue - block
        yellow - block
        purple - block
        orange - block
        table - table
    )
    (:init
        (clear green)
        (clear red)
        (clear blue)
        (clear yellow)
        (clear purple)
        (clear orange)
        (ontable green)
        (ontable red)
        (ontable blue)
        (ontable yellow)
        (ontable purple)
        (ontable orange)
        (handempty robot1)
    )
    (:goal
        (and
            (clear orange)
            (clear purple)
            (clear yellow)
            (clear blue)
            (clear red)
            (clear green)
            (ontable green)
            (ontable red)
            (ontable blue)
            (ontable yellow)
            (ontable purple)
            (ontable orange)
            (holding orange)
            (holding purple)
            (holding yellow)
            (holding blue)
            (holding red)
            (holding green)
            (on orange red)
            (on red blue)
            (on blue yellow)
            (on yellow purple)
            (on purple green)
        )
    )
)