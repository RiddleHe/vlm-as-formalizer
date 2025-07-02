(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        red - block
        blue - block
        purple - block
        pink - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (clear red)
        (on blue red)
        (clear blue)
        (on purple blue)
        (clear purple)
        (on pink purple)
        (clear pink)
        (handempty robot1)
    )
    (:goal (and
        (on pink purple)
        (on purple blue)
        (on blue red)
        (on red pink)
    ))
)