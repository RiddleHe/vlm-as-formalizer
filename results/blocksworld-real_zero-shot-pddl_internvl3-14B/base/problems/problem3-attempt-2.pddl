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
        ; The current scenario as seen in the image (purple on red, yellow on orange, orange on green, green on blue)
        (holding yellow robot1)
        (on orange yellow)
        (on green orange)
        (on blue green)
        (on purple red)
        (handempty robot1)
        (clear red)
        (clear blue)
    )
    (:goal
        ; Corrected goal based on the stack in the image
        (and 
            (on purple red)
            (on yellow orange)
            (on orange green)
            (on green blue)
        )
    )
)