(define (problem put_task_keys_lamp)
  (:domain put_task)

  (:objects
    robot - agent
    keys - object
    tall_lamp - object
    dining_table - receptacle
  )

  (:init
    ;; Receptacle relations from the scene
    (inReceptacle keys dining_table)
    (inReceptacle tall_lamp dining_table)

    ;; The robot starts not at any object's location (no atLocation facts)

    ;; Lamp initial state (assume off)
    (not (isOn tall_lamp))
  )

  (:goal
    (and
      ;; "by the light of a tall lamp" -> turn the lamp on
      (isOn tall_lamp)

      ;; "look at some keys" -> be at the keys' location
      (atLocation robot keys)
    )
  )
)