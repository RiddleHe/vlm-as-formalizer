(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        purple - block
        blue - block
        yellow - block
        green - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable red)
        (ontable purple)
        (ontable blue)
        (ontable yellow)
        (ontable green)
        (clear orange)
        (clear red)
        (clear purple)
        (clear blue)
        (clear yellow)
        (clear green)
        (handempty robot1)
        (on orange red)
        (on red purple)
        (on purple blue)
        (on blue yellow)
        (on yellow green)
    )
    (:goal (and
        (on purple green)
        (on blue red)
        (on red orange)
        (on orange yellow)
    ))
)