(define (problem put_task_lettuce_washed_sliced_on_counter)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 - sink
    counter1 - receptacle

    knife1 - knife
    lettuce1 - object
  )

  (:init
    ;; receptacle properties
    (openable sink1)

    ;; object locations (treated as being "in" a receptacle area)
    (inReceptacle knife1 counter1)
    (inReceptacle lettuce1 counter1)

    ;; propagate agent location from receptacle once robot goes there
    ;; (no initial atLocation facts; robot must GotoLocation first)
  )

  (:goal
    (and
      (isClean lettuce1)
      (isSliced lettuce1)
      (inReceptacle lettuce1 counter1)
    )
  )
)