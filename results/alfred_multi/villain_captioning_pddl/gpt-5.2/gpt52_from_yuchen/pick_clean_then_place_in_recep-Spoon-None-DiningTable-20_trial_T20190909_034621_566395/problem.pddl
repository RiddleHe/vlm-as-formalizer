(define (problem put_task_scene1)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 - sink
    table1 - receptacle

    spoon1 - object
  )

  (:init
    ;; receptacle properties
    (openable sink1)

    ;; initial placements
    (inReceptacle spoon1 sink1)

    ;; robot initially not at any location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isClean spoon1)
      (inReceptacle spoon1 table1)
    )
  )
)