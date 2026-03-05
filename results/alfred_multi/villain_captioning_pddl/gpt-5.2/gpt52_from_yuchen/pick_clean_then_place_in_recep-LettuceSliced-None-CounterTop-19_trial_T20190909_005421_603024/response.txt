(define (problem put_task_lattece_slice_washed_counter)
  (:domain put_task)

  (:objects
    robot - agent
    sink1 - sink
    fridge1 - fridge
    counter1 - receptacle
    knife1 - knife
    lettuce1 - object
  )

  (:init
    ;; receptacles / locations
    (atLocation robot counter1)

    ;; objects on the counter (by the sink)
    (inReceptacle knife1 counter1)
    (inReceptacle lettuce1 counter1)

    ;; fridge properties (present but not needed)
    (openable fridge1)
  )

  (:goal
    (and
      (isClean lettuce1)
      (isSliced lettuce1)
      (inReceptacle lettuce1 counter1)
    )
  )
)