(define (problem blockstacking)
    (:domain blocksworld)
    (:objects
        red - block
        orange - block
        purple - block
        green - block
        yellow - block
        pink - block
        rob - robot
    )
    (:init
        (holding green rob) 
        (handfull rob)
        (on yellow green)
        (on pink yellow)
        (on orange pink)
        (on purple orange)
        (on red purple)
        (clear green)
        (clear yellow)
        (clear pink)
        (clear orange)
        (clear purple)
    )
    (:goal 
        (and
            (on green yellow)
            (on yellow pink)
            (on pink red)
            (on purple orange)
            (on orange red)
            (clear purple)
            (handempty rob)
            (not (holding ?x - block rob))
        )
    )
)