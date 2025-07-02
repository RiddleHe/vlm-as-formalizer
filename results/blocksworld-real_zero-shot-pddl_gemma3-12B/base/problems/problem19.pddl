(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        orange - block
        blue - block
        yellow - block
        green - block
        red - block
        purple - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable blue)
        (ontable yellow)
        (ontable green)
        (ontable red)
        (ontable purple)
        (clear orange)
        (clear blue)
        (clear yellow)
        (clear green)
        (clear red)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on blue orange)
        (on yellow green)
        (on green red)
        (on red purple)
    ))
)