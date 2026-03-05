(define (problem put_task_problem)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink

    blacktable1 - receptacle

    potato1 - object
    knife1 - knife
    saltshaker1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)
    (openable sink1)

    ;; initial object placements (from scene)
    (inReceptacle saltshaker1 blacktable1)
    (inReceptacle knife1 blacktable1)
    (inReceptacle potato1 fridge1)

    ;; robot initial condition
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isSliced potato1)
      (isHot potato1)
      (inReceptacle potato1 blacktable1)
      (atLocation robot saltshaker1)
    )
  )
)