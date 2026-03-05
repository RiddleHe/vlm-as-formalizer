(define (problem put_task_clean_egg_on_counter)
  (:domain put_task)

  (:objects
    robot - agent

    countertop - receptacle
    sink1 - sink
    microwave1 - microwave

    egg1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; object locations / containment
    (inReceptacle egg1 microwave1)

    ;; robot initially not at any object's location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isClean egg1)
      (inReceptacle egg1 countertop)
    )
  )
)