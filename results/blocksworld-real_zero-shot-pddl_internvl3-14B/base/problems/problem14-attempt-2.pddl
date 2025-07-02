(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        purple - block
        green - block
        blue - block
        red - block
        robot1 - robot
    )
    (:init
        (clear orange)
        (clear yellow)
        (clear green)
        (clear purple)
        (clear red)
        (handempty robot1)
        (ontable orange)
        (ontable yellow)
        (ontable purple)
        (ontable green)
        (ontable blue)
        (ontable red)
    )
    (:goal 
        (and 
            (on purple yellow)
            (on yellow orange)
            (clear purple)
            (on blue red)
            (on red green)
            (clear blue)
        )
    )
)