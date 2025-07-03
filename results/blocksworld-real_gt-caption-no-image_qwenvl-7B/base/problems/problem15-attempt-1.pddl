(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        table - table
        green - block
        yellow - block
        red - block
        blue - block
        purple - block
        orange - block
    )
    (:init
        (clear green)
        (clear yellow)
        (clear red)
        (clear blue)
        (clear purple)
        (clear orange)
        (ontable green)
        (ontable yellow)
        (ontable red)
        (ontable blue)
        (ontable purple)
        (ontable orange)
        (handempty robot1)
    )
    (:goal
        (and
            (clear orange)
            (clear purple)
            (clear blue)
            (clear yellow)
            (clear green)
            (clear red)
            (ontable orange)
            (ontable purple)
            (ontable blue)
            (ontable yellow)
            (ontable green)
            (ontable red)
            (holding orange)
            (holding purple)
            (holding blue)
            (holding yellow)
            (holding green)
            (holding red)
            (on orange purple)
            (on purple blue)
            (on blue yellow)
            (on yellow green)
            (on green red)
        )
    )
)