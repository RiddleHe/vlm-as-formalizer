(define (problem cooking-cucumber-slicing)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    cucumber1 - vegetable
    sliced_cucumber1 - sliced-vegetable
    knife1 - tool
    bowl1 - bowl
    cutting_board1 table1 - location
)
(:init
    (at cucumber1 cutting_board1)
    (is-cucumber cucumber1)
    (sliced-version-of sliced_cucumber1 cucumber1)
    (at knife1 cutting_board1)
    (is-knife knife1)
    (robot-free robot1)
    (holding robot2 knife1)
    (clear cucumber1)
    (clear bowl1)
    (on-table bowl1)
    (on-table cutting_board1)
    (on-table cucumber1)
)
(:goal 
    (and 
        (is-sliced cucumber1)
        (in-bowl sliced_cucumber1 bowl1)
    )
)
)