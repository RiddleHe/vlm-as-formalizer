(define (problem put_task_problem_1)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    sink1 - sink

    knife1 - knife
    potato1 - object
    egg1 - object
    lettuce1 - object
    smallitem1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    ;; microwave door appears closed -> not (opened microwave1)

    ;; robot starts holding nothing and is not at any location (no atLocation facts)
    ;; (also no holds/holdsAny facts)

    ;; object placements
    (inReceptacle potato1 sink1)
    (inReceptacle egg1 sink1)
    (inReceptacle lettuce1 sink1)

    ;; countertop items (not in any receptacle); locations will be reached via GotoLocation
    ;; (knife1 and smallitem1 are present but not placed in a receptacle)
  )

  (:goal
    (and
      (inReceptacle potato1 sink1)
      (isHot potato1)
    )
  )
)