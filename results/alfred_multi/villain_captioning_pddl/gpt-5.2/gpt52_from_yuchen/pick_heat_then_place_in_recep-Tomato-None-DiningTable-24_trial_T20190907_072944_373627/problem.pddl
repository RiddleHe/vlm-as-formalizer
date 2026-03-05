(define (problem puttask_heated_tomato_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    sink1 - sink

    table1 - receptacle

    knife1 - knife
    tomato1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; initial placements / locations
    (inReceptacle tomato1 table1)
    (inReceptacle knife1 table1)

    ;; robot initially not at any object's location
  )

  (:goal
    (and
      (isHot tomato1)
      (inReceptacle tomato1 table1)
    )
  )
)