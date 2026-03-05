(define (problem put_hand_towel_on_counter)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 - sink
    counter1 - receptacle

    hand_towel1 - object
  )

  (:init
    ;; receptacle properties
    ;; (no openable/opened receptacles visible/needed)

    ;; object locations / containment
    (inReceptacle hand_towel1 sink1)

    ;; robot initial condition: not at any object's location and holds nothing
    ;; (atLocation robot ...) intentionally omitted
  )

  (:goal
    (and
      (inReceptacle hand_towel1 counter1)
    )
  )
)