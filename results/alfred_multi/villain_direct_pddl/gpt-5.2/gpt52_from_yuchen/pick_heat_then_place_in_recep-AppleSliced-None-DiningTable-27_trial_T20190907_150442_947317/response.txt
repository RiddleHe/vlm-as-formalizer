(define (problem warm_apple_piece)
  (:domain put_task)
  (:objects
    robot - agent

    microwave1 - microwave

    apple1 apple2 apple3 - object
    tomato1 - object
    bread1 - object
    spoon1 - object
    pan1 - object

    shaker1 shaker2 shaker3 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; robot initially not at any object's location (no atLocation facts)

    ;; object placements (all visible on table/counter, not inside any receptacle)
    ;; no (inReceptacle ...) relations observed
  )

  (:goal
    (and
      (isHot apple1)
      (isSliced apple1)
    )
  )
)