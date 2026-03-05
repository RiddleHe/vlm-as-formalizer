(define (problem put_task_lettuce_slice_cold_on_counter)
  (:domain put_task)

  (:objects
    robot - agent

    ;; receptacles / locations
    fridge1 - fridge
    sink1 - sink
    microwave1 - microwave
    counter1 - receptacle

    ;; tools and items
    knife1 - knife
    lettuce1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; object locations (treated as being "in" a receptacle/location)
    (inReceptacle lettuce1 counter1)
    (inReceptacle knife1 counter1)

    ;; robot starts not at any object's location (no atLocation facts for robot)
  )

  (:goal
    (and
      (inReceptacle lettuce1 counter1)
      (isSliced lettuce1)
      (isCool lettuce1)
    )
  )
)