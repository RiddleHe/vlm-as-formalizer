(define (problem cooking-slice-and-bowl)
(:domain cooking)
(:objects
    robot1 - robot
    cucumber1 - vegetable
    carrot1 - vegetable
    tomato1 - vegetable
    knife1 - tool
    bowl1 - object
    table1 - location
    cutting_board1 - location
)
(:init
    (at cucumber1 table1)
    (at carrot1 table1)
    (at tomato1 table1)
    (at bowl1 table1)
    (at knife1 cutting_board1)
    (clear cucumber1)
    (clear carrot1)
    (clear tomato1)
    (clear knife1)
    (clear bowl1)
    (is-bowl bowl1)
    (is-vegetable cucumber1)
    (is-vegetable carrot1)
    (is-vegetable tomato1)
    (is-knife knife1)
)
(:goal (and
    (sliced cucumber1)
    (sliced carrot1)
    (sliced tomato1)
    (in-bowl cucumber1)
    (in-bowl carrot1)
    (in-bowl tomato1)
))
)