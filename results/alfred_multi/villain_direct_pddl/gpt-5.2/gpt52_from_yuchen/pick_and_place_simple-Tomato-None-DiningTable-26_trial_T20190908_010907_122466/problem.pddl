(define (problem put_tomato_on_table)
  (:domain put_task)
  (:objects
    robot - agent
    table - receptacle
    fridge - fridge
    tomato - object
    spatula - object
    bread - object
  )
  (:init
    ;; receptacle properties
    (openable fridge)

    ;; object locations (tomato is on the table, so treat it as in the table receptacle)
    (inReceptacle tomato table)
    (inReceptacle spatula table)
    (inReceptacle bread table)

    ;; robot starts not at any object's location (no atLocation facts for robot)
  )
  (:goal
    (and
      (inReceptacle tomato table)
    )
  )
)