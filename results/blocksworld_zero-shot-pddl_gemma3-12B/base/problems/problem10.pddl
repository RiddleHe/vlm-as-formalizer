(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        blue - block
        pink - block
        red - block
        yellow - block
        orange - block
        green - block
        robot1 - robot
    )
    (:init
        (ontable blue)
        (ontable pink)
        (ontable red)
        (ontable yellow)
        (ontable orange)
        (ontable green)
        (clear blue)
        (clear pink)
        (clear red)
        (clear yellow)
        (clear orange)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on blue pink)
        (on pink red)
        (on yellow orange)
        (on orange green)
    ))
)