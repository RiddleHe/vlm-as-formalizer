(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        red - block
        blue - block
        orange - block
        green - block
        purple - block
        yellow - block
    )
    (:init
        (clear red)
        (clear blue)
        (clear orange)
        (clear green)
        (clear purple)
        (clear yellow)
        (ontable red)
        (ontable blue)
        (ontable orange)
        (ontable green)
        (ontable purple)
        (ontable yellow)
        (handempty robot1)
        (on blue red)
        (on orange blue)
        (on green orange)
        (on purple green)
        (on yellow purple)
    )
    (:goal
        (and
            (on orange purple)
            (on purple blue)
            (on yellow red)
            (on red green)
            (handempty robot1)
        )
    )
)