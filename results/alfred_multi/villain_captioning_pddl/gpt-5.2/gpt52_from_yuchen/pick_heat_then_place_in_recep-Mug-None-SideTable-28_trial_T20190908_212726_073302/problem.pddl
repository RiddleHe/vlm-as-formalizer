(define (problem put_task_microwaved_mug_on_left_shelves)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    mug1 - object
    left_shelves1 - receptacle
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (opened microwave1)

    ;; object locations / containment
    (inReceptacle mug1 microwave1)

    ;; robot initially not at any object's location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isHot mug1)
      (inReceptacle mug1 left_shelves1)
    )
  )
)