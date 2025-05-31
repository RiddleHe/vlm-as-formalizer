(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        orange - block
        green - block
        yellow - block
        red - block
        blue - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on orange purple)
        (clear orange)
        (ontable green)
        (on yellow green)
        (clear yellow)
        (ontable red)
        (on blue red)
        (clear blue)
        ; purple -> orange
        ; green -> yellow
        ; red -> blue
    )
    (:goal (and (on red yellow)
        (on blue orange)
        (on purple green)))
)
    