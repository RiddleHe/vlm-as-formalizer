(define (problem put_chilled_bowl_on_table)
  (:domain put_task)

  (:objects
    robot - agent
    fridge1 - fridge
    table1 - receptacle
    bowl1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)
    (not (opened fridge1))

    ;; initial object locations
    (inReceptacle bowl1 fridge1)

    ;; bowl is already chilled
    (isCool bowl1)
  )

  (:goal
    (and
      (inReceptacle bowl1 table1)
    )
  )
)