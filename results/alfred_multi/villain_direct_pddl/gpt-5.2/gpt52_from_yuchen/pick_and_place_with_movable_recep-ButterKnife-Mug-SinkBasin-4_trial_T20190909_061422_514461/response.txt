(define (problem put_task_kitchen_clean_put_sink)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 - sink
    fridge1 - fridge
    microwave1 - microwave

    knife1 - knife
    mug1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)
    (openable microwave1)

    ;; object locations (robot must go to them first)
    (atLocation robot sink1)
    (atLocation robot knife1)
    (atLocation robot mug1)

    ;; initially holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isClean knife1)
      (isClean mug1)
      (inReceptacle knife1 sink1)
      (inReceptacle mug1 sink1)
    )
  )
)