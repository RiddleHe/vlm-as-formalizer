(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        orange
        red
        yellow
        purple
        green
        blue
        robot
    )
    (:init
        (on orange red)
        (on red yellow)
        (on yellow purple)
        (on purple green)
        (on green blue)
        (ontable blue)
        (clear orange)
        (handempty robot)
    )
    (:goal (and
        (on orange purple)
        (on purple green)
        (on green blue)
        (on blue yellow)
        (on yellow red)
        (ontable red)
        (clear orange)
    ))
)