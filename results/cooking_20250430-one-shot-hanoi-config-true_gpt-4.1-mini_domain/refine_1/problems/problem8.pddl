(define (problem cooking_task2)
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
    (free_hand robot2)
    (holding robot1 knife1)
    (at knife1 loc_table)
    (at bowl1 loc_table)
    (at cucumber1 loc_table)
    (at tomato1 loc_cutting_board)
    (at tomato2 loc_cutting_board)
)
(:goal (and
    (sliced cucumber1)
    (at cucumber1 loc_table)  ; Cucumber placed at bowl location (loc_table)
    (at tomato1 loc_table)    ; Tomatoes placed at bowl location (loc_table)
    (at tomato2 loc_table)
))
)