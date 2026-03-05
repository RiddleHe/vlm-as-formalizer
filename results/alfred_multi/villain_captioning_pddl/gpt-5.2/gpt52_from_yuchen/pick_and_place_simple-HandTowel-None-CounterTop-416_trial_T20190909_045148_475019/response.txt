(define (problem bathroom_put_towel_on_counter)
  (:domain put_task)
  (:objects
    robot - agent

    sink1 - sink

    counter1 - receptacle

    hand_towel1 - object
    pump_bottle1 - object
    yellow_bottle1 - object
    purple_container1 - object
    cylinder_item1 - object
  )

  (:init
    ;; receptacle facts
    (openable sink1)

    ;; object locations (agent must navigate before interacting)
    (inReceptacle hand_towel1 sink1)
    (inReceptacle pump_bottle1 counter1)
    (inReceptacle yellow_bottle1 counter1)
    (inReceptacle purple_container1 counter1)
    (inReceptacle cylinder_item1 counter1)

    ;; robot starts not at any object's location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle hand_towel1 counter1)
    )
  )
)