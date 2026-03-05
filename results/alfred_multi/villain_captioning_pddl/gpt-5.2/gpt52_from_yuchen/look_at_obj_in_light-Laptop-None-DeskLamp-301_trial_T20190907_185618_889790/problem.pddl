(define (problem bedroom_laptop_light)
  (:domain put_task)

  (:objects
    robot - agent
    laptop1 laptop2 phone book alarm_clock lamp - object
  )

  (:init
    ;; Agent starts not at any object's location and holds nothing.
    ;; (No (atLocation robot ...), (holdsAny robot), or (holds robot ...) facts initially.)

    ;; No receptacles (microwave/fridge/sink) are present/used in this scene.
    ;; No initial on/off state is asserted for the lamp (unknown from image).
  )

  (:goal
    (and
      (holds robot laptop1)
      (isOn lamp)
      (isToggled lamp)
    )
  )
)