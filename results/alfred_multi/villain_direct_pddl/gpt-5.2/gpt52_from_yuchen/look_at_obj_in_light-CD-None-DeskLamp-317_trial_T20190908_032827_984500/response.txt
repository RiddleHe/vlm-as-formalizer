(define (problem inspect-cd-by-lamp)
  (:domain put_task)
  (:objects
    robot - agent
    lamp - object
    cd - object
    dresser - receptacle
  )

  (:init
    ;; receptacle relations from the scene
    (inReceptacle cd dresser)
    (inReceptacle lamp dresser)

    ;; robot starts not at any object's location (no atLocation facts)

    ;; lamp initially off (no (isOn lamp))
  )

  (:goal
    (and
      ;; to inspect by lamp light, ensure the lamp has been toggled on
      (isOn lamp)
      (isToggled lamp)

      ;; and the robot is at the CD location to inspect it
      (atLocation robot cd)
    )
  )
)