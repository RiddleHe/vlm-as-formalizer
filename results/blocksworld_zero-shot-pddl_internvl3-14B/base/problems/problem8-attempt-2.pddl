(define (problem blockstacking)
    (:domain blocksworld)
    (:objects
        green - block
        yellow - block
        pink - block
        orange - block
        purple - block
        red - block
        rob - robot
    )
    (:init
        (on green yellow)
        (on yellow pink)
        (on pink orange)
        (on orange purple)
        (on purple red)
        (clear red)
        (clear purple)
        (clear orange)
        (ontable orange)
        (clear yellow)
        (clear green)
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