(define (problem blocksworld1)
    (:domain blocksworld)
    (:objects
        orange red purple green yellow blue - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable red)
        (ontable purple)
        (ontable green)
        (ontable yellow)
        (ontable blue)

        (clear blue)
        (clear orange)
        (clear red)
        (clear purple)
        (clear green)
        (clear yellow)

        (handempty robot1)
    )
    (:goal (and
        (on blue orange)
        (on orange red)
        (on red purple)
        (on purple green)
        (on green yellow)
        (ontable yellow)
    ))
)