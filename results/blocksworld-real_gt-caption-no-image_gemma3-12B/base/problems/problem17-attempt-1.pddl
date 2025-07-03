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
        (on blue orange)
        (on green blue)
        (on purple green)
        (on yellow purple)
        (clear yellow)
    )
    (:goal (and
        (on orange purple)
        (on blue orange)
        (on yellow red)
        (on red green)
        (on green yellow)
    ))
)