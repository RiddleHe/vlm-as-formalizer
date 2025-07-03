(define (problem blocksworld-problem1)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        orange red purple blue yellow green - block
    )
    (:init
        (handempty robot1)
        ; initial stack: orange over red over purple over blue over yellow over green
        (on orange red)
        (on red purple)
        (on purple blue)
        (on blue yellow)
        (on yellow green)
        (ontable green)
        (clear orange)
    )
    (:goal (and
        (on purple green)
        (ontable green)
        (clear purple)
        (on blue red)
        (on red orange)
        (on orange yellow)
        (ontable yellow)
        (clear blue)
    ))
)