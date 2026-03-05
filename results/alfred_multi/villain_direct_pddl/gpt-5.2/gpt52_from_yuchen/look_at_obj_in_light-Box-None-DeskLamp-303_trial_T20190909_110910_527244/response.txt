(define (problem put_task_box_lamp)
  (:domain put_task)

  (:objects
    robot - agent
    box - receptacle
    lamp - object
  )

  (:init
    ;; robot initially not at any object's location and holds nothing
    (not (holdsAny robot))

    ;; scene relationships (lamp is on the desk; box is on the floor)
    ;; no receptacle relations are required for this task
  )

  (:goal
    (and
      ;; "Look at a box by the light of a lamp." -> be at both the box and the lamp, and have the lamp turned on/toggled
      (atLocation robot box)
      (atLocation robot lamp)
      (isOn lamp)
      (isToggled lamp)
    )
  )
)