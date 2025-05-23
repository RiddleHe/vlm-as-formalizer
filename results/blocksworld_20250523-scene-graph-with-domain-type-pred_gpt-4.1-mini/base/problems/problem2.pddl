(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        red blue purple pink - block
        r1 - robot
    )
    (:init
        (on red purple)
        (on purple blue)
        (ontable blue)
        (ontable pink)
        (clear red)
        (clear pink)
        (handempty r1)
    )
    (:goal (and
        (on red blue)
        (on blue purple)
        (on purple pink)
    ))
)