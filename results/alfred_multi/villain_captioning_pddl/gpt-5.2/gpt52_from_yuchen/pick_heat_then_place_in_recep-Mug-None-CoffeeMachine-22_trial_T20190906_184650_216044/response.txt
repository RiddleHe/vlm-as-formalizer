(define (problem put_warm_coffee_cup_in_coffee_maker)
  (:domain put_task)

  (:objects
    robot - agent
    microwave1 - microwave
    coffeemaker1 - receptacle
    coffeecup1 - object
  )

  (:init
    ;; receptacle properties from the scene
    (openable microwave1)

    ;; inferred/assumed from instruction: there exists a warm (hot) coffee cup
    (isHot coffeecup1)

    ;; coffee maker is a receptacle; no evidence it is openable/opened, so leave unspecified

    ;; robot starts not holding anything
    (not (holdsAny robot))

    ;; NOTE: per prompt, robot is initially not at any object's location, so no (atLocation robot ...)
    ;; Cup location is not visible in the image; leave unspecified (not in any receptacle).
  )

  (:goal
    (and
      (inReceptacle coffeecup1 coffeemaker1)
      (isHot coffeecup1)
    )
  )
)