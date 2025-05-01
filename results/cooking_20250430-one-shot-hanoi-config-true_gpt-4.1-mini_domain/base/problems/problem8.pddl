(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1
        robot2
        knife1 - knife
        bowl1 - bowl
        cucumber1 - cucumber
        tomato1 - tomato
        tomato2 - tomato
        loc_table
        loc_cutting_board
    )
    (:init
        (free_hand robot1)
        (free_hand robot2)
        (at knife1 loc_table)
        (at bowl1 loc_table)
        (at cucumber1 loc_table)
        (at tomato1 loc_cutting_board)
        (at tomato2 loc_cutting_board)
        (holding robot1 knife1)
    )
    (:goal (and
        (sliced cucumber1)
        (in cucumber1 bowl1)
        (in tomato1 bowl1)
        (in tomato2 bowl1)
    ))
)