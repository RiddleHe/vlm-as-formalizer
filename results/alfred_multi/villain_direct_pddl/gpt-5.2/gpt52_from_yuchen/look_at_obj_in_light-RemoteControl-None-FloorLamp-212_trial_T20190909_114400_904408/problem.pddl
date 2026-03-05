(define (problem put_task_lamp_remote)
  (:domain put_task)
  (:objects
    robot - agent
    lamp remote_control couch - object
  )

  (:init
    ;; robot starts not at any object's location (no atLocation facts)

    ;; object locations
    (atLocation robot couch)
    (atLocation robot remote_control)

    ;; remote is on the couch
    (inReceptacle remote_control couch)

    ;; lamp initial state: off
    (not (isOn lamp))
  )

  (:goal
    (and
      (isOn lamp)
      (isToggled lamp)
    )
  )
)