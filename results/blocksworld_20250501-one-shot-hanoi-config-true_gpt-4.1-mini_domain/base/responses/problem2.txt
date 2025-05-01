(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        red blue purple pink - block
        robot1 - robot
    )
    (:init
        (on purple blue)
        (on-table blue)
        (on-table red)
        (on-table pink)
        (clear purple)
        (clear red)
        (clear pink)
        (handempty robot1)
    )
    (:goal
        (and
            (on red blue)
            (on blue purple)
            (on purple pink)
        )
    )
)