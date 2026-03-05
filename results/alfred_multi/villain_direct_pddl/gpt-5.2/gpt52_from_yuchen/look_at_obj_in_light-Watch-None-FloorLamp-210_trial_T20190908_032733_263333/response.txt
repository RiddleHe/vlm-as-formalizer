(define (problem put_task_scene1)
  (:domain put_task)
  (:objects
    robot - agent
    ring - object
    lamp - object
  )
  (:init
    ;; Robot starts not at any object's location (no atLocation facts)

    ;; Scene facts
    ;; Ring is on the dresser (modeled as being at the ring location directly)
    ;; Lamp is a toggleable object; initially assumed off (no (isOn lamp))
    (atLocation robot ring)
    ;; Note: robot is initially not at any object's location per instruction, so we omit all atLocation in init.
  )
  (:goal
    (and
      (holds robot ring)
      (isOn lamp)
    )
  )
)