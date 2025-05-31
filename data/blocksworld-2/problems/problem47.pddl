(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        blue - block
        yellow - block
        purple - block
        green - block
        orange - block
        robot - robot
    )
    (:init
        (ontable red)
        (on blue red)
        (on yellow blue)
        (on purple yellow)
        (on green purple)
        (on orange green)
        (clear orange)
        ; red -> blue -> yellow -> purple -> green -> orange
    )
    (:goal (and (on orange green)
        (on blue orange)
        (on red blue)
        (on purple red)
        (on yellow purple)))
)
    