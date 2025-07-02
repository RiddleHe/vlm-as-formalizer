(define (problem blockstacking)
    (:domain blocksworld)
    (:objects
        green - block
        yellow - block
        pink - block
        purple - block
        orange - block
        red - block
        rob - robot
    )
    (:init
        (on green yellow)
        (on yellow pink)
        (on pink purple)
        (on purple orange)
        (on orange red)
        (clear red)
        (clear orange)
        (clear purple)
        (clear yellow)
        (clear green)
        (ontable green)
        (handempty rob)
    )
    (:goal 
        (and
            (on green yellow)
            (on yellow pink)
            (on pink red)
            (on purple orange)
            (on orange red)
            (handempty rob)
            (not (holding ?x - block rob))
        )
    )
)