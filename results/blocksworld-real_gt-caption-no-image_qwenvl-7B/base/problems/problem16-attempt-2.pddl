(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        green - block
        red - block
        yellow - block
        purple - block
        orange - block
        blue - block
    )
    (:init
        (clear green)
        (clear red)
        (clear yellow)
        (clear purple)
        (clear orange)
        (clear blue)
        (ontable green)
        (ontable red)
        (ontable yellow)
        (ontable purple)
        (ontable orange)
        (ontable blue)
        (handempty robot1)
        (on green red)
        (on red orange)
        (on orange purple)
        (on purple blue)
        (on blue yellow)
    )
    (:goal
        (and
            (on green red)
            (on red orange)
            (on orange purple)
            (on purple blue)
            (on blue yellow)
            (clear green)
            (clear red)
            (clear yellow)
            (clear purple)
            (clear orange)
            (clear blue)
            (ontable green)
            (ontable red)
            (ontable yellow)
            (ontable purple)
            (ontable orange)
            (ontable blue)
            (handempty robot1)
        )
    )
)