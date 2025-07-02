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
        (ontable blue)
        (clear blue)
        (on purple blue)
        (clear purple)
        (on red purple)
        (clear red)
        (on green red)
        (clear green)
        (on pink green)
        (clear pink)
        (on yellow pink)
        (clear yellow)
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