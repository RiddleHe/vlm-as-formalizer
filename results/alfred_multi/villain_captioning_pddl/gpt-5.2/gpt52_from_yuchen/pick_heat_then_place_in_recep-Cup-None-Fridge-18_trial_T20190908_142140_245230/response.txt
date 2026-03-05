(define (problem put_task_microwaved_cup_into_fridge)
  (:domain put_task)
  (:objects
    agent1 - agent

    sink1 - sink
    microwave1 - microwave
    fridge1 - fridge

    cup1 - object
    knife1 - knife
    lettuce1 - object
  )

  (:init
    ;; agent starts not at any object's location (so no atLocation facts initially)

    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)
    ;; sink is a receptacle but not openable in this domain file

    ;; objects in receptacles (from the scene)
    (inReceptacle knife1 sink1)
    (inReceptacle lettuce1 sink1)

    ;; note: cup1 is on the countertop (not modeled as a receptacle), so it is not in any receptacle initially
    ;; microwave and fridge appear closed; we leave (opened ...) false by omission
  )

  (:goal
    (and
      (inReceptacle cup1 fridge1)
      (isHot cup1)
    )
  )
)