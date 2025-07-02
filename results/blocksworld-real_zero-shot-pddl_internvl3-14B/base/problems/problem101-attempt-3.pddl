(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        red - block
        green - block
        purple - block
        blue - block
        robot1 - robot
    )
    (:init
        ; Initial state based on image
        (on green purple) 
        (on purple blue)
        (on yellow purple)
        (on orange red)
        (clear yellow)
        (clear red)
        (clear orange)
        (ontable green)
        (ontable blue)
        (ontable red)
        (handempty robot1)
    )
    (:goal
        (and
            (on yellow orange)  ; Yellow over Orange
            (on red green)      ; Red over Green
            (on blue purple)    ; Blue over Purple
        )
    )
)