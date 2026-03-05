(define (problem put_task_potato_slice_fridge)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    microwave1 - microwave

    potato_slice1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)
    (openable microwave1)

    ;; initial object locations (from scene context)
    ;; potato slice is available on the counter area (not inside any receptacle initially)
    (atLocation robot potato_slice1)
    (atLocation robot microwave1)
    (atLocation robot fridge1)

    ;; robot starts holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isHot potato_slice1)
      (isSliced potato_slice1)
      (inReceptacle potato_slice1 fridge1)
    )
  )
)