(define (problem blocksworld-stacks)
    (:domain blocksworld)
    (:objects
        yellow - block
        green - block
        pink - block
        red - block
        purple - block
        robot - robot
    )
    (:init
        (clear yellow)
        (clear green)
        (clear pink)
        (clear red)
        (clear purple)
        (ontable yellow)
        (ontable green)
        (ontable pink)
        (ontable red)
        (ontable purple)
        (handempty robot)
    )
    (:goal
        (and
            (on yellow green)
            (on green pink)
            (on red purple)
        )
    )
)