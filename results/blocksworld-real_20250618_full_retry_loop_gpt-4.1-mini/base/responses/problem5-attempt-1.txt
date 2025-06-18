(define (problem blocksworld_real_task)
    (:domain blocksworld)
    (:objects
        yellow
        red
        orange
        purple
        blue
        green
        robot1
    )
    (:init
        (ontable yellow)
        (ontable red)
        (ontable orange)
        (ontable purple)
        (ontable blue)
        (ontable green)
        (clear yellow)
        (clear red)
        (clear orange)
        (clear purple)
        (clear blue)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on yellow purple)
        (on blue red)
        (on orange green)
    ))
)