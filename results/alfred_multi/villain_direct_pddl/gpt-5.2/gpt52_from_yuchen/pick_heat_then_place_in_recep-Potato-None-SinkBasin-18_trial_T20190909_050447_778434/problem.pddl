(define (problem put_task_problem)
  (:domain put_task)
  (:objects
    robot - agent
    microwave1 - microwave
    sink1 - sink
    potato1 - object
    egg1 - object
    lettuce1 - object
  )
  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; object locations / containment
    (inReceptacle potato1 sink1)
    (inReceptacle egg1 sink1)
    (inReceptacle lettuce1 sink1)

    ;; robot starts not holding anything
    (not (holdsAny robot))
  )
  (:goal
    (and
      (inReceptacle potato1 sink1)
      (isHot potato1)
    )
  )
)