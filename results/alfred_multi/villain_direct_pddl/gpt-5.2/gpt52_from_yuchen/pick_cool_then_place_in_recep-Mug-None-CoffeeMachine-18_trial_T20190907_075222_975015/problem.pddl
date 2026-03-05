(define (problem cool_cup_on_coffeemaker)
  (:domain put_task)
  (:objects
    robot - agent
    fridge1 - fridge
    coffeemaker1 - receptacle
    cup1 - object
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts)

    ;; Scene relations
    (inReceptacle cup1 coffeemaker1)
  )

  (:goal
    (and
      (isCool cup1)
    )
  )
)