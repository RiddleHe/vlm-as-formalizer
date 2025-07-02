(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        yellow - block
        green - block
        pink - block
        purple - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable green)
        (ontable pink)
        (ontable purple)
        (on red purple)
        (clear yellow)
        (clear green)
        (clear pink)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on yellow green)
        (on green pink)
        (on red purple)
    ))
)