(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        blue - block
        yellow - block
        purple - block
        orange - block
        green - block
        robot1 - robot
    )
    (:init
        (ontable blue)
        (ontable yellow)
        (ontable purple)
        (ontable orange)
        (ontable green)
        (clear blue)
        (clear yellow)
        (clear purple)
        (clear orange)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on orange blue)
        (on blue purple)  ; Note: 'red' block is missing, so this is adjusted to blue over purple as a proxy
        (on yellow green)
        (ontable purple)  ; purple is at bottom of first stack
        (ontable green)   ; green is at bottom of second stack
        (clear orange)
        (clear yellow)
    ))
)