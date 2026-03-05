(define (problem put_warm_apple_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    table1 - receptacle

    apple1 - object
  )

  (:init
    ;; receptacle properties / state
    (openable microwave1)
    ;; (opened microwave1) is not assumed

    ;; object locations (apple is on the table)
    (inReceptacle apple1 table1)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle apple1 table1)
      (isHot apple1)
    )
  )
)