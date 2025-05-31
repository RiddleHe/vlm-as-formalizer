(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        purple - block
        orange - block
        red - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on green blue)
        (on purple green)
        (on orange purple)
        (clear orange)
        (ontable red)
        (on yellow red)
        (clear yellow)
        ; blue -> green -> purple -> orange
        ; red -> yellow
    )
    (:goal (and (on purple red)
        (on yellow green)
        (on orange yellow)
        (on blue orange)))
)
    