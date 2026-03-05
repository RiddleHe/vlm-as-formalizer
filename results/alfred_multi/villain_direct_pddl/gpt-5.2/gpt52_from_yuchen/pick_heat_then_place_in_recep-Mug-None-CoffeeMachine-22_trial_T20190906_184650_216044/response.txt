(define (problem put_warm_coffee_cup_in_coffee_maker)
  (:domain put_task)

  (:objects
    robot - agent
    microwave1 - microwave
    coffeemaker1 - receptacle
    cup1 - object
  )

  (:init
    ;; receptacle properties
    ;; (openable microwave1) ; not visibly required/used
    ;; (openable coffeemaker1) ; coffee maker not modeled as openable here

    ;; initial locations (robot starts at no location per instruction)
    (atLocation robot microwave1)
    (inReceptacle cup1 microwave1)

    ;; states
    (isHot cup1)
  )

  (:goal
    (and
      (inReceptacle cup1 coffeemaker1)
      (isHot cup1)
    )
  )
)