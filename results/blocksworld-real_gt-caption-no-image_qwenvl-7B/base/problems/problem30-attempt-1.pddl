(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        orange - block
        red - block
        yellow - block
        purple - block
        green - block
        blue - block
        table - table
    )
    (:init
        (clear orange)
        (clear red)
        (clear yellow)
        (clear purple)
        (clear green)
        (clear blue)
        (ontable orange)
        (ontable red)
        (ontable yellow)
        (ontable purple)
        (ontable green)
        (ontable blue)
        (handempty robot1)
    )
    (:goal
        (and
            (clear orange)
            (clear purple)
            (clear green)
            (clear blue)
            (clear yellow)
            (clear red)
            (ontable orange)
            (ontable purple)
            (ontable green)
            (ontable blue)
            (ontable yellow)
            (ontable red)
            (holding orange)
            (on purple orange)
            (on green purple)
            (on blue green)
            (on yellow green)
            (on red yellow)
        )
    )
)