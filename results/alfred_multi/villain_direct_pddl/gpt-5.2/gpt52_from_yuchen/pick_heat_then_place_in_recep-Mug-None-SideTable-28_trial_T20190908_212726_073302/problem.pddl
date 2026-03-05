(define (problem put_task_microwaved_mug_on_left_shelves)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    shelf_left1 - receptacle

    mug1 - object
  )

  (:init
    ;; receptacles
    (openable microwave1)

    ;; object locations / containment
    (inReceptacle mug1 microwave1)

    ;; robot initially not at any object's location (so no atLocation facts)
  )

  (:goal
    (and
      (isHot mug1)
      (inReceptacle mug1 shelf_left1)
    )
  )
)