(define (problem put_washed_tomato_on_black_table)
  (:domain put_task)
  (:objects
    robot - agent
    sink1 - sink
    fridge1 - fridge
    black_table1 - receptacle
    tomato1 - object
  )
  (:init
    ;; receptacle properties
    ;; (openable fridge1) ; not required for cooling/putting in this task and not clearly open/close from image

    ;; object locations
    (inReceptacle tomato1 sink1)

    ;; robot initially not at any location (per instruction)
  )
  (:goal
    (and
      (isClean tomato1)
      (inReceptacle tomato1 black_table1)
    )
  )
)