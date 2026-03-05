(define (problem warm-mug-put-in-cabinet)
  (:domain put_task)

  (:objects
    robot - agent

    cabinet1 - receptacle
    sink1 - sink
    microwave1 - microwave

    mug1 - object
    knife1 - knife
  )

  (:init
    ;; receptacle properties / states
    (openable cabinet1)
    ;; cabinet appears closed in the image (so not (opened cabinet1))

    ;; object placements (treat coffee machine area as "atLocation" with the mug itself)
    (atLocation robot sink1)          ;; arbitrary start location; robot is not at mug/microwave/cabinet
    (atLocation mug1 mug1)
    (atLocation knife1 knife1)
    (atLocation cabinet1 cabinet1)
    (atLocation sink1 sink1)
    (atLocation microwave1 microwave1)

    ;; robot starts holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isHot mug1)
      (inReceptacle mug1 cabinet1)
    )
  )
)