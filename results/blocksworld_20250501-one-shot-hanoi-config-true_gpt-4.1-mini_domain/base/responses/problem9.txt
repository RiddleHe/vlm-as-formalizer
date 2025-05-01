(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        red
        orange
        yellow
        green
        blue
        purple
        robot1
    )
    (:init
        (ontable red)
        (ontable orange)
        (ontable yellow)
        (ontable green)
        (ontable blue)
        (ontable purple)
        (clear orange)
        (clear yellow)
        (clear green)
        (clear blue)
        (clear purple)
        (clear red)
        (armempty robot1)
    )
    (:goal (and
        (on purple blue)
        (on blue green)
        (on green yellow)
        (on yellow red)
        (ontable red)
    ))
)