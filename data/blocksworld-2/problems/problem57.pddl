(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        yellow - block
        orange - block
        blue - block
        purple - block
        red - block
        robot - robot
    )
    (:init
        (ontable green)
        (on yellow green)
        (clear yellow)
        (ontable orange)
        (on blue orange)
        (clear blue)
        (ontable purple)
        (on red purple)
        (clear red)
        ; green -> yellow
        ; orange -> blue
        ; purple -> red
    )
    (:goal (and (on green blue)
        (on yellow red)
        (on orange purple)))
)
    