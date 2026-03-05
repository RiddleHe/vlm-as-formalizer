(define (problem chill_apple_put_on_white_table)
  (:domain put_task)
  (:objects
    robot - agent

    fridge1 - fridge
    table1 - receptacle

    apple1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; object locations (robot starts at no location)
    (inReceptacle apple1 table1)
  )

  (:goal
    (and
      (isCool apple1)
      (inReceptacle apple1 table1)
    )
  )
)