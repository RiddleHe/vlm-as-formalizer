(define (problem put_cold_lettuce_slice_on_counter)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    sink1 - sink
    microwave1 - microwave

    knife1 - knife
    lettuce1 - object
    counter1 - receptacle
  )

  (:init
    ;; receptacle properties
    (openable fridge1)
    (openable microwave1)

    ;; object locations (from scene)
    (inReceptacle lettuce1 counter1)
    (inReceptacle knife1 counter1)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isSliced lettuce1)
      (isCool lettuce1)
      (inReceptacle lettuce1 counter1)
    )
  )
)