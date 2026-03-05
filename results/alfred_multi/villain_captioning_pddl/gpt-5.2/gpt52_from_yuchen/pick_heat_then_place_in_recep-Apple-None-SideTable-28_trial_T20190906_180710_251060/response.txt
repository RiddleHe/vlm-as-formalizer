(define (problem put_task_warm_apple_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    white_table - receptacle
    black_side_table - receptacle

    apple1 - object
    salt_shaker1 - object
    pan1 - object
    spoon1 - object
    bottle1 - object
    mat1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    ;; microwave door appears closed in the scene (so not (opened microwave1))

    ;; object locations (on/in receptacles)
    (inReceptacle apple1 white_table)
    (inReceptacle salt_shaker1 white_table)
    (inReceptacle pan1 white_table)

    (inReceptacle spoon1 black_side_table)
    (inReceptacle bottle1 black_side_table)
    (inReceptacle mat1 black_side_table)

    ;; agent starts not holding anything and not at any object's location
    ;; (so no (holdsAny robot), no (holds robot ...), and no (atLocation robot ...))
  )

  (:goal
    (and
      (isHot apple1)
      (inReceptacle apple1 white_table)
    )
  )
)