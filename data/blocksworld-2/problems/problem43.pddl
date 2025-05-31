(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        green - block
        blue - block
        purple - block
        red - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on orange yellow)
        (clear orange)
        (ontable green)
        (on blue green)
        (clear blue)
        (ontable purple)
        (on red purple)
        (clear red)
        ; yellow -> orange
        ; green -> blue
        ; purple -> red
    )
    (:goal (and (on yellow red)
        (on orange green)
        (on blue purple)))
)
    