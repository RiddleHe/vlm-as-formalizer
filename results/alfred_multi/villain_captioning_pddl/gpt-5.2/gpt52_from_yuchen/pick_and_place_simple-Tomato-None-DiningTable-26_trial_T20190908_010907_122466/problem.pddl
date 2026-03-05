(define (problem put_tomato_on_table)
  (:domain put_task)
  (:objects
    robot - agent
    table - receptacle
    fridge1 - fridge
    tomato1 - object
    knife1 - knife
  )
  (:init
    ;; receptacle properties
    (openable fridge1)
    ;; fridge is closed initially (so not (opened fridge1))

    ;; object locations / containment
    (inReceptacle tomato1 table)
    (inReceptacle knife1 table)

    ;; robot initially not at any object's location and holds nothing
    ;; (so no (atLocation robot ...) facts)
    ;; (so no (holdsAny robot) and no (holds robot ...) facts)
  )
  (:goal
    (and
      (inReceptacle tomato1 table)
    )
  )
)