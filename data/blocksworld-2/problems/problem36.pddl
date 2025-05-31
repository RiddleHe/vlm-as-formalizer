(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        orange - block
        green - block
        purple - block
        blue - block
        robot - robot
    )
    (:init
        (ontable red)
        (on yellow red)
        (clear yellow)
        (ontable orange)
        (on green orange)
        (clear green)
        (ontable purple)
        (on blue purple)
        (clear blue)
        ; red -> yellow
        ; orange -> green
        ; purple -> blue
    )
    (:goal (and (on green yellow)
        (on blue red)
        (on orange purple)))
)
    