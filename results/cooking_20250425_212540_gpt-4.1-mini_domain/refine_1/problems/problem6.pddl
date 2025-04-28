(define (problem slice_and_place)
  (:domain cooking)
  (:objects
    robot1 - robot
    carrot cucumber - vegetable
    knife - tool
    bowl1 - bowl
    table - location
  )
  (:init
    (at carrot table)
    (at cucumber table)
    (at bowl1 table)
    (available knife)
    (is_vegetable carrot)
    (is_vegetable cucumber)
    (is_bowl bowl1)
  )
  (:goal
    (and
      (sliced carrot)
      (sliced cucumber)
      (in carrot bowl1)
      (in cucumber bowl1)
    )
  )
)