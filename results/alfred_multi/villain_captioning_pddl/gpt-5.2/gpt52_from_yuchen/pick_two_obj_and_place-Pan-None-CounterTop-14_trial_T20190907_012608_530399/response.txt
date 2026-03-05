(define (problem place_two_pans_on_counter)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    counter1 - receptacle

    pan1 pan2 - object
  )

  (:init
    ;; robot initially not at any object's location
    ;; (so no atLocation facts)

    ;; receptacle properties
    (openable microwave1)

    ;; initial object locations (both pans on the stovetop area; model as being at that location)
    (atLocation robot pan1)
    (atLocation robot pan2)

    ;; pans are not in any receptacle initially (counter is separate)
  )

  (:goal
    (and
      (inReceptacle pan1 counter1)
      (inReceptacle pan2 counter1)
    )
  )
)