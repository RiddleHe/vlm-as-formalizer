(define (problem cooking-slice-and-bowl)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cucumber - vegetable
        tomato1 tomato2 - vegetable
        knife - tool
        bowl - object
        chopping-board - object
        table - location
        board-stand - location
    )
    (:init
        (at cucumber table)
        (at bowl table)
        (at knife board-stand)
        (at tomato1 board-stand)
        (at tomato2 board-stand)
        (on-chopping-board tomato1)
        (on-chopping-board tomato2)
        (clear cucumber)
        (clear tomato1)
        (clear tomato2)
        (clear knife)
        (is-bowl bowl)
        (is-knife knife)
        (free robot1)
        (holding robot2 knife)
    )
    (:goal (and
        (sliced cucumber)
        (in-bowl cucumber bowl)
        (in-bowl tomato1 bowl)
        (in-bowl tomato2 bowl)
    ))
)