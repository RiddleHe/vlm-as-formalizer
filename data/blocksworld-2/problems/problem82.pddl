(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        purple - block
        orange - block
        red - block
        yellow - block
        green - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on purple blue)
        (clear purple)
        (ontable orange)
        (on red orange)
        (clear red)
        (ontable yellow)
        (on green yellow)
        (clear green)
        ; blue -> purple
        ; orange -> red
        ; yellow -> green
    )
    (:goal (and (on yellow orange)
        (on red purple)
        (on green blue)))
)
    