(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        blue - block
        green - block
        orange - block
        purple - block
        robot - robot
    )
    (:init
        (ontable red)
        (on yellow red)
        (clear yellow)
        (ontable blue)
        (on green blue)
        (clear green)
        (ontable orange)
        (on purple orange)
        (clear purple)
        ; red -> yellow
        ; blue -> green
        ; orange -> purple
    )
    (:goal (and (on yellow red)
        (on orange green)
        (on purple blue)))
)
    