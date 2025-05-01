(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        yellow pink green red purple blue - block
    )
    (:init
        (ontable yellow)
        (clear yellow)
        (ontable pink)
        (clear pink)
        (ontable green)
        (clear green)
        (ontable red)
        (clear red)
        (ontable purple)
        (clear purple)
        (ontable blue)
        (clear blue)
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