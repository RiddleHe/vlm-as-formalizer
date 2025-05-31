(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        red - block
        purple - block
        green - block
        blue - block
        orange - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on red yellow)
        (clear red)
        (ontable purple)
        (on green purple)
        (clear green)
        (ontable blue)
        (on orange blue)
        (clear orange)
        ; yellow -> red
        ; purple -> green
        ; blue -> orange
    )
    (:goal (and (on green orange)
        (on yellow blue)
        (on red purple)))
)
    