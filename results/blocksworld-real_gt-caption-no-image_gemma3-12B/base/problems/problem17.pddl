(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        red - block
        blue - block
        orange - block
        green - block
        purple - block
        yellow - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable red)
        (clear red)
        (ontable orange)
        (clear orange)
        (ontable blue)
        (clear blue)
        (ontable green)
        (clear green)
        (ontable purple)
        (clear purple)
        (ontable yellow)
        (clear yellow)
    )
    (:goal (and
        (on orange purple)
        (on blue orange)
        (on yellow red)
        (on red green)
    ))
)