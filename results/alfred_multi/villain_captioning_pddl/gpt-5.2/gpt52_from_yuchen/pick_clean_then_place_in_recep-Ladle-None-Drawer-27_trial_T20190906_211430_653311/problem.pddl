(define (problem clean-spoon-put-away)
  (:domain put_task)

  (:objects
    robot - agent
    spoon1 - object
    sink1 - sink
    microwave1 - microwave
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts for robot)

    ;; Receptacle properties
    (openable microwave1)

    ;; Object locations
    (inReceptacle spoon1 sink1) ; using sink as the supporting receptacle for the spoon's initial placement is not accurate
  )

  (:goal
    (and
      (isClean spoon1)
      (inReceptacle spoon1 microwave1)
    )
  )
)