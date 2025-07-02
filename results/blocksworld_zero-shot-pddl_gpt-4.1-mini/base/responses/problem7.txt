(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        yellow pink green red purple blue - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable pink)
        (ontable green)
        (ontable red)
        (ontable purple)
        (ontable blue)
        (clear yellow)
        (clear pink)
        (clear green)
        (clear red)
        (clear purple)
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