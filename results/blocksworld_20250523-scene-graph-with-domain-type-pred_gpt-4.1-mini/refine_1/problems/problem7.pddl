(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        yellow pink green red purple blue
        robot1
    )
    (:init
        (on yellow pink)
        (on pink green)
        (ontable green)
        (ontable red)
        (on red purple)
        (ontable purple)
        (ontable blue)
        (clear yellow)
        (clear blue)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on yellow pink)
        (on pink green)
        (on green red)
        (on red purple)
        (on purple blue)
    ))
)