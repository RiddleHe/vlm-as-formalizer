(define (problem put_task_warm_sliced_bread_on_counter)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    sink1 - sink

    counter1 - receptacle

    bread1 - object
    knife1 - knife
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; object locations / containment
    (inReceptacle bread1 microwave1)
    (inReceptacle knife1 counter1)

    ;; robot initially not at any object's location (per instruction)
  )

  (:goal
    (and
      (isHot bread1)
      (isSliced bread1)
      (inReceptacle bread1 counter1)
    )
  )
)