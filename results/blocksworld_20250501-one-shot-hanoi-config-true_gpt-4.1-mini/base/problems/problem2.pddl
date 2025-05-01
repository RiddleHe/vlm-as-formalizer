(define (problem stack_red_blue_purple_pink)
    (:domain blocksworld)
    (:objects
        red blue purple pink - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (ontable blue)
        (ontable purple)
        (ontable pink)
        (clear red)
        (clear blue)
        (clear purple)
        (clear pink)
        (handempty robot1)
    )
    (:goal (and
        (on red blue)
        (on blue purple)
        (on purple pink)
    ))
)