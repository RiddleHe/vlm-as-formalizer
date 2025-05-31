(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        purple - block
        red - block
        yellow - block
        orange - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on green blue)
        (clear green)
        (ontable purple)
        (on red purple)
        (on yellow red)
        (on orange yellow)
        (clear orange)
        ; blue -> green
        ; purple -> red -> yellow -> orange
    )
    (:goal (and (on red green)
        (on purple yellow)
        (on blue purple)
        (on orange blue)))
)
    