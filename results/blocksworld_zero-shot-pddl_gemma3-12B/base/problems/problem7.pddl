(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        yellow - block
        pink - block
        green - block
        red - block
        purple - block
        blue - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable blue)
        (clear blue)
        (ontable green)
        (clear green)
        (ontable red)
        (clear red)
        (ontable purple)
        (clear purple)
        (ontable yellow)
        (clear yellow)
        (ontable pink)
        (clear pink)
    )
    (:goal (and
        (on yellow pink)
        (on pink green)
        (on green red)
        (on red purple)
        (on purple blue)
    ))
)