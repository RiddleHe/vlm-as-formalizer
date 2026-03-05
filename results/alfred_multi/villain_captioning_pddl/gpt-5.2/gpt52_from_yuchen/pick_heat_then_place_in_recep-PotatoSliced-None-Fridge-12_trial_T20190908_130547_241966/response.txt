(define (problem put_task_kitchen_potato_slice_fridge)
  (:domain put_task)
  (:objects
    robot - agent

    fridge1 - fridge
    microwave1 - microwave
    sink1 - sink

    potatoSlice1 - object
    pan1 - receptacle
  )

  (:init
    ;; receptacle properties
    (openable fridge1)
    (openable microwave1)

    ;; initial object placements / locations inferred from the scene
    (inReceptacle potatoSlice1 pan1)

    ;; robot starts not at any object's location (no atLocation facts for robot)

    ;; no objects are initially held
    ;; no cooking/heating state given initially
  )

  (:goal
    (and
      (inReceptacle potatoSlice1 fridge1)
      (isHot potatoSlice1)
      (isSliced potatoSlice1)
    )
  )
)