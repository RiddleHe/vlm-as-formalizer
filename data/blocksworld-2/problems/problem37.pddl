(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        green - block
        blue - block
        red - block
        yellow - block
        orange - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on green purple)
        (on blue green)
        (on red blue)
        (on yellow red)
        (on orange yellow)
        (clear orange)
        ; purple -> green -> blue -> red -> yellow -> orange
    )
    (:goal (and (on orange yellow)
        (on purple orange)
        (on green purple)
        (on red green)
        (on blue red)))
)
    