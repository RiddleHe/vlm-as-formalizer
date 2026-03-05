(define (problem put_sliced_bread_in_fridge)
  (:domain put_task)

  (:objects
    robot - agent
    fridge1 - fridge
    bread1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)
    ;; (opened fridge1) is not set: assume closed initially

    ;; object locations (robot must navigate first)
    (inReceptacle bread1 fridge1)

    ;; robot initially not at any object's location (no atLocation facts)
  )

  (:goal
    (and
      (isSliced bread1)
      (inReceptacle bread1 fridge1)
    )
  )
)