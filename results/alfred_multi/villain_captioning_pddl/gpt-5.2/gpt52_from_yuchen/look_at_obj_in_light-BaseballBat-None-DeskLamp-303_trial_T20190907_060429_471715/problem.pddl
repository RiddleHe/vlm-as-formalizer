(define (problem bedroom_turn_on_lamp_examine_bat)
  (:domain put_task)

  (:objects
    robot - agent
    lamp - object
    bat - object
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts)

    ;; No receptacles (microwave/fridge/sink) are present in this scene
    ;; Lamp is initially off (so isOn is not asserted)
  )

  (:goal
    (and
      (isOn lamp)
      (atLocation robot bat)
    )
  )
)