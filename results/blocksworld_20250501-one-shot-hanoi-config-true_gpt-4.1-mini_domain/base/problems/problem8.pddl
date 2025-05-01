(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        green yellow pink purple orange red - block
        robot1 - robot
    )
    (:init
        (on green yellow)
        (on yellow pink)
        (on pink purple)
        (on purple orange)
        (on orange red)
        (on-table red)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on green yellow)
        (on yellow pink)
        (on-table pink)
        (on purple orange)
        (on orange red)
        (on-table red)
    ))
)