(define (problem cool_cup_coffeemaker)
  (:domain put_task)
  (:objects
    robot - agent
    cup - object
    coffeemaker - object
    fridge - fridge
  )
  (:init
    ;; agent starts not at any object's location (no atLocation facts)

    ;; scene relations
    (atLocation robot cup)
    (atLocation robot coffeemaker)

    ;; cup is on/at the coffee maker; coffee maker is not a receptacle in this domain,
    ;; so we represent this as co-location rather than inReceptacle.

    ;; fridge exists for cooling actions (not visible, but required by domain)
    (atLocation robot fridge)
  )
  (:goal
    (and
      (isCool cup)
    )
  )
)