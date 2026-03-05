(define (problem clean_spoon_put_away_1)
  (:domain put_task)

  (:objects
    robot - agent
    sink1 - sink
    microwave1 - microwave
    fridge1 - fridge
    spoon1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; object locations from the scene
    ;; spoon is on the small table to the left of the microwave area
    (atLocation robot sink1)
    (atLocation robot microwave1)
    (atLocation robot fridge1)
    (atLocation robot spoon1)

    ;; robot starts holding nothing
    ;; (holdsAny robot) is intentionally not set
  )

  (:goal
    (and
      (isClean spoon1)
      (inReceptacle spoon1 fridge1)
    )
  )
)