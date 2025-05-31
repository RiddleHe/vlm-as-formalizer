(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        orange - block
        red - block
        blue - block
        yellow - block
        green - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on orange purple)
        (on red orange)
        (on blue red)
        (on yellow blue)
        (on green yellow)
        (clear green)
        ; purple -> orange -> red -> blue -> yellow -> green
    )
    (:goal (and (on green red)
        (on blue green)
        (on yellow blue)
        (on purple yellow)
        (on orange purple)))
)
    