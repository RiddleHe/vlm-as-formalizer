(define (problem put_task_keys_lamp)
  (:domain put_task)
  (:objects
    robot - agent
    lamp - object
    keys - object
    table - receptacle
  )

  (:init
    ;; robot starts not at any object's location (no atLocation facts for robot)

    ;; scene placements
    (inReceptacle lamp table)
    (inReceptacle keys table)
  )

  (:goal
    (and
      ;; be at the keys to look at them
      (atLocation robot keys)
      ;; have the lamp turned on to provide light
      (isOn lamp)
    )
  )
)