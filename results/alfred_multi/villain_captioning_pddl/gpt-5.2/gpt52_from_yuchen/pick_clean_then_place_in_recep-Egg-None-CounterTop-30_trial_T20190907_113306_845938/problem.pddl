(define (problem put_task_clean_egg_on_counter)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 - sink
    microwave1 - microwave

    egg1 egg2 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; object locations (eggs are in the microwave)
    (inReceptacle egg1 microwave1)
    (inReceptacle egg2 microwave1)

    ;; robot initial condition: not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      ;; there exists an egg that is clean and on the counter (i.e., not in any receptacle)
      (exists (?e - object)
        (and
          (isClean ?e)
          (not (exists (?r - receptacle) (inReceptacle ?e ?r)))
        )
      )
    )
  )
)