(define (problem put_task_heated_tomato_in_sink)
  (:domain put_task)
  (:objects
    robot - agent

    sink1 - sink
    microwave1 - microwave

    tomato1 tomato2 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; object locations / containment
    (inReceptacle tomato1 microwave1)
    (inReceptacle tomato2 microwave1)

    ;; robot starts not at any object's location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle tomato1 sink1)
      (isHot tomato1)
    )
  )
)