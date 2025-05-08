(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1
        robot2
        bowl1 - object
        tomato1 - vegetable
        carrot1 - vegetable
        knife1 - tool
        counter1 - location
        cutting_board1 - location
    )
    (:init
        (counter counter1)
        (cutting_board cutting_board1)
        (bowl bowl1)
        (vegetable tomato1)
        (vegetable carrot1)
        (knife knife1)
        (on bowl1 counter1)
        (on tomato1 counter1)
        (on carrot1 cutting_board1)
        (free robot1)
        (holding robot2 knife1)
    )
    (:goal (and
        (sliced tomato1)
        (on tomato1 bowl1)
        (on carrot1 bowl1)
    ))
)