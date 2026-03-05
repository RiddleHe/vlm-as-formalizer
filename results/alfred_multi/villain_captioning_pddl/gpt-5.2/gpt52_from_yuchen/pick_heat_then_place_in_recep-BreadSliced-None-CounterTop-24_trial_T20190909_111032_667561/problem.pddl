(define (problem put_task_kitchen_bread_warm_on_counter)
  (:domain put_task)
  (:objects
    robot - agent

    microwave1 - microwave
    sink1 - sink

    bread1 - object
    counter_front_sink1 - receptacle
  )

  (:init
    ;; robot starts not at any location and holds nothing

    ;; receptacle properties
    (openable microwave1)

    ;; object locations
    (inReceptacle bread1 sink1)

    ;; define the target counter area as a receptacle the robot can go to
    ;; (no extra facts needed beyond its existence)
  )

  (:goal
    (and
      (isHot bread1)
      (inReceptacle bread1 counter_front_sink1)
    )
  )
)