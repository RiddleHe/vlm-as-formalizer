(define (problem blocksworld_stack)
    (:domain blocksworld)
    (:objects
        yellow pink green red purple blue orange - block
        robot1 - robot
    )
    (:init
        (on yellow pink)
        (on pink green)
        (ontable green)
        (on red purple)
        (ontable purple)
        (ontable blue)
        (ontable orange)
        (clear yellow)
        (clear red)
        (clear blue)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on yellow pink)
        (on pink green)
        (on green red)
        (on red purple)
        (on purple blue)
        (ontable blue)
    ))
)