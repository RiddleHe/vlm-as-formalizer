(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        purple - block
        red - block
        yellow - block
        orange - block
        green - block
        blue - block
    )
    (:init
        ; Initial state: All blocks are on the table, each block is clear.
        (clear robot1)
        (on-table purple)
        (clear purple)
        (on-table red)
        (clear red)
        (on-table yellow)
        (clear yellow)
        (on-table orange)
        (clear orange)
        (on-table green)
        (clear green)
        (on-table blue)
        (clear blue)
    )
    (:goal
        ; Define the goal state: one stack purple on red
        (and 
            (on purple red)
            (clear red)
            (clear yellow)
            ; Define another stack yellow on orange on green on blue
            (on yellow orange)
            (on orange green)
            (on green blue)
        )
    )
)