(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        orange - block
        blue - block
        yellow - block
        red - block
        green - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on orange purple)
        (on blue orange)
        (on yellow blue)
        (on red yellow)
        (on green red)
        (clear green)
        ; purple -> orange -> blue -> yellow -> red -> green
    )
    (:goal (and (on red orange)
        (on yellow red)
        (on purple yellow)
        (on blue purple)
        (on green blue)))
)
    