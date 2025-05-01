(define (problem cooking_task2)
  (:domain cooking)
  (:objects
    robot1
    robot2
    knife1 - tool
    tomato1 - tomato
    carrot1 carrot2 - carrot
    bowl1 - bowl
    loc_table loc_plate - location
  )
  (:init
    (knife knife1)
    (at knife1 loc_table)
    (at tomato1 loc_table)
    (at carrot1 loc_plate)
    (at carrot2 loc_plate)
    (at bowl1 loc_table)
    (holding robot1 knife1)
  )
  (:goal
    (and
      (sliced tomato1)
      (in tomato1 bowl1)
      (in carrot1 bowl1)
      (in carrot2 bowl1)
    )
  )
)