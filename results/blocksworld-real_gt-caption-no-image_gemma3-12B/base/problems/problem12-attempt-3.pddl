(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        purple - block
        green - block
        yellow - block
        blue - block
        orange - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable purple)  ; Purple is initially on the table
        (on purple green)  ; Purple is on green
        (on green yellow)  ; Green is on yellow
        (on yellow blue)  ; Yellow is on blue
        (on blue orange)  ; Blue is on orange
        (on orange red)  ; Orange is on red
        (clear red)       ; Red is clear (nothing on top of it)
        (handempty robot1) ; Robot is initially empty-handed
    )
    (:goal
        (and
            (on yellow orange)  ; Yellow is on orange
            (on purple green)  ; Purple is on green
            (on red blue)      ; Red is on blue
        )
    )
)