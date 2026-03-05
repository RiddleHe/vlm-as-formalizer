(define (problem put_task_problem1)
  (:domain put_task)
  (:objects
    robot - agent
    microwave1 - microwave
    fridge1 - fridge
    grey_plate1 - object
  )
  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; initial containment / locations from the scene
    (inReceptacle grey_plate1 microwave1)

    ;; robot initially not at any object's location (per instruction)
  )
  (:goal
    (and
      (inReceptacle grey_plate1 fridge1)
      (isHot grey_plate1)
    )
  )
)