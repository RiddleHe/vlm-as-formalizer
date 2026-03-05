(define (problem put_task_kitchen_bread_fridge_apple)
  (:domain put_task)
  (:objects
    robot - agent

    fridge1 - fridge
    sink1 - sink

    knife1 - knife

    bread1 - object
    apple1 - object
    counter1 - receptacle
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; object locations (everything is on/in the counter initially)
    (inReceptacle bread1 counter1)
    (inReceptacle apple1 counter1)
    (inReceptacle knife1 counter1)

    ;; agent starts not at any location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isSliced bread1)
      (inReceptacle bread1 counter1)
      (inReceptacle apple1 counter1)
    )
  )
)