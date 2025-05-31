(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        yellow - block
        purple - block
        red - block
        orange - block
        blue - block
        robot - robot
    )
    (:init
        (ontable green)
        (on yellow green)
        (clear yellow)
        (ontable purple)
        (on red purple)
        (clear red)
        (ontable orange)
        (on blue orange)
        (clear blue)
        ; green -> yellow
        ; purple -> red
        ; orange -> blue
    )
    (:goal (and (on red blue)
        (on green orange)
        (on yellow purple)))
)
    