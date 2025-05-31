(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        red - block
        yellow - block
        purple - block
        orange - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on green blue)
        (clear green)
        (ontable red)
        (on yellow red)
        (on purple yellow)
        (on orange purple)
        (clear orange)
        ; blue -> green
        ; red -> yellow -> purple -> orange
    )
    (:goal (and (on purple orange)
        (on blue purple)
        (on red green)
        (on yellow red)))
)
    