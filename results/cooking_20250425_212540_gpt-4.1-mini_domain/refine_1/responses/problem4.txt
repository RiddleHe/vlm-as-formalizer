(define (problem cooking1)
  (:domain cooking)
  (:objects
    robot1 - robot
    carrot1 tomato1 - vegetable
    cleaver1 - tool
    bowl1 - bowl
    table1 - location
  )
  (:init
    (at carrot1 table1)
    (at tomato1 table1)
    (at cleaver1 table1)
    (at bowl1 table1)
    (clean cleaver1)
    (available carrot1)
    (available tomato1)
  )
  (:goal (and
    (in carrot1 bowl1)
    (in tomato1 bowl1)
    (sliced carrot1)
    (sliced tomato1)
  ))
)