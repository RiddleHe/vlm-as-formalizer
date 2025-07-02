(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        yellow orange red purple blue green - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable orange)
        (ontable red)
        (ontable purple)
        (ontable blue)
        (ontable green)
        (clear yellow)
        (clear orange)
        (clear red)
        (clear purple)
        (clear blue)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on yellow orange)
        (on orange red)
        (on red purple)
        (on blue green)
    ))
)