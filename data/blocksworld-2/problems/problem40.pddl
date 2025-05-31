(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        yellow - block
        purple - block
        orange - block
        green - block
        red - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on yellow blue)
        (clear yellow)
        (ontable purple)
        (on orange purple)
        (on green orange)
        (on red green)
        (clear red)
        ; blue -> yellow
        ; purple -> orange -> green -> red
    )
    (:goal (and (on green orange)
        (on red green)
        (on blue yellow)
        (on purple blue)))
)
    