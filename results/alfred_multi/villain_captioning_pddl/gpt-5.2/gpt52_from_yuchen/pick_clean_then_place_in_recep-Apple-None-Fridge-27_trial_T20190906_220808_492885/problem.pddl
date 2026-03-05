(define (problem puttask_kitchen_clean_apple_in_fridge)
  (:domain put_task)
  (:objects
    robot - agent
    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink
    apple1 - object
    glass1 - object
    bowl1 - object
    egg1 - object
  )
  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; initial containment based on scene
    (inReceptacle glass1 sink1)
    (inReceptacle bowl1 sink1)
    (inReceptacle egg1 sink1)

    ;; robot starts holding nothing and is not at any object's location (no atLocation facts)
    ;; microwave/fridge appear closed (so not (opened ...)), and apple is not yet clean/hot/cool/etc.
  )
  (:goal
    (and
      (isClean apple1)
      (inReceptacle apple1 fridge1)
    )
  )
)