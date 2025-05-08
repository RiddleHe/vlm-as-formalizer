(define (problem cooking1)
    (:domain cooking)
    (:objects
        robot1
        robot2
        bowl1 - bowl
        carrot1 tomato1 - vegetable
        knife1 - tool
        counter1 - counter
        cutting_board1 - cutting_board
    )
    (:init
        (at bowl1 counter1)
        (at carrot1 counter1)
        (at tomato1 counter1)
        (at cutting_board1 counter1)
        (free robot1)
        (holding robot2 knife1)
        (not (sliced carrot1))
        (not (sliced tomato1))
        (not (on_cutting_board carrot1))
        (not (on_cutting_board tomato1))
    )
    (:goal 
      (and 
        (sliced carrot1)
        (sliced tomato1)
        (at carrot1 bowl1)
        (at tomato1 bowl1)
      )
    )
)