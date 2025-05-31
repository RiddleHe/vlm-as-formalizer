(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        blue - block
        green - block
        purple - block
        yellow - block
        orange - block
        robot - robot
    )
    (:init
        (ontable red)
        (on blue red)
        (on green blue)
        (on purple green)
        (clear purple)
        (ontable yellow)
        (on orange yellow)
        (clear orange)
        ; red -> blue -> green -> purple
        ; yellow -> orange
    )
    (:goal (and (on green red)
        (on blue green)
        (on purple yellow)
        (on orange purple)))
)
    