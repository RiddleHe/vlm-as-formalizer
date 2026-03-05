(define (problem ring_and_lamp)
  (:domain put_task)

  (:objects
    robot - agent
    ring1 lamp1 watch1 statue1 tv1 - object
  )

  (:init
    ;; Robot initially not at any object's location (no atLocation facts)

    ;; No receptacles / openables in this scene, so no openable/opened facts

    ;; Ring is not in any receptacle and not held initially (no inReceptacle/holds facts)

    ;; Lamp appears off initially, so isOn is not asserted
  )

  (:goal
    (and
      (holds robot ring1)
      (isOn lamp1)
    )
  )
)