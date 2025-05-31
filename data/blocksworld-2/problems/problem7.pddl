(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        yellow - block
        orange - block
        green - block
        blue - block
        red - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on yellow purple)
        (clear yellow)
        (ontable orange)
        (on green orange)
        (clear green)
        (ontable blue)
        (on red blue)
        (clear red)
        ; purple -> yellow
        ; orange -> green
        ; blue -> red
    )
    (:goal (and (on purple yellow)
        (on blue red)
        (on green orange)))
)
    