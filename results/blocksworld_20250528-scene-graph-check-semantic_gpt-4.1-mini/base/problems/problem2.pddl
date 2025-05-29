(define (problem block_stack)
    (:domain blocksworld)
    (:objects
        red blue purple pink - block
        robot1 - robot
    )
    (:init
        (on red blue)
        (on blue purple)
        (ontable purple)
        (ontable pink)
        (clear red)
        (clear pink)
        (handempty robot1)
        (handfull robot1)
        (holding pink)
    )
    (:goal (and
        (on red blue)
        (on blue purple)
        (on purple pink)
    ))
)