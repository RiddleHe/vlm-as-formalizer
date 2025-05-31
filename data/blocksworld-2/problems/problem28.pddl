(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        green - block
        blue - block
        purple - block
        orange - block
        robot - robot
    )
    (:init
        (ontable red)
        (on yellow red)
        (clear yellow)
        (ontable green)
        (on blue green)
        (clear blue)
        (ontable purple)
        (on orange purple)
        (clear orange)
        ; red -> yellow
        ; green -> blue
        ; purple -> orange
    )
    (:goal (and (on red orange)
        (on yellow purple)
        (on green blue)))
)
    