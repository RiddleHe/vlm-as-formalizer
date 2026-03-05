(define (problem blocksworld_rearrange)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        green - block
        blue - block
        purple - block
        red - block
        robot1 - robot
    )
    (:init
        (on blue orange)
        (on yellow green)
        (on red purple)
        (ontable orange)
        (ontable green)
        (ontable purple)
        (clear blue)
        (clear yellow)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on orange yellow)
        (on green blue)
        (on purple red)
    ))
)