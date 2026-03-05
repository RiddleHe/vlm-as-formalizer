(define (problem put_task_kitchen_heated_plate_fridge)
  (:domain put_task)

  (:objects
    robot - agent
    microwave1 - microwave
    fridge1 - fridge
    plate1 - object
  )

  (:init
    ;; receptacles
    (openable microwave1)
    (openable fridge1)

    ;; the plate is heated (per instruction)
    (isHot plate1)

    ;; robot starts not at any location and holds nothing (so no atLocation/holds/holdsAny facts)

    ;; object locations (inferred minimal consistent setup from scene; plate on/at microwave area)
    (atLocation robot microwave1)
    (atLocation robot plate1)
  )

  (:goal
    (and
      (inReceptacle plate1 fridge1)
      (isHot plate1)
    )
  )
)