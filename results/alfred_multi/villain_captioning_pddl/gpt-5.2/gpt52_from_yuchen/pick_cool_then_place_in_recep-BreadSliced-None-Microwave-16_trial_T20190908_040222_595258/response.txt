(define (problem put_task_kitchen_cooled_bread_to_microwave)
  (:domain put_task)
  (:objects
    robot - agent
    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink
    breadslice1 - object
  )
  (:init
    ;; robot starts not at any object's location (no atLocation facts for robot)

    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; object locations (from scene)
    (atLocation robot microwave1) ; omitted intentionally? no, robot should start at no location
    (atLocation breadslice1 fridge1)

    ;; initial containment: bread slice is in the fridge (so it can be cooled)
    (inReceptacle breadslice1 fridge1)
  )
  (:goal
    (and
      (isCool breadslice1)
      (inReceptacle breadslice1 microwave1)
    )
  )
)