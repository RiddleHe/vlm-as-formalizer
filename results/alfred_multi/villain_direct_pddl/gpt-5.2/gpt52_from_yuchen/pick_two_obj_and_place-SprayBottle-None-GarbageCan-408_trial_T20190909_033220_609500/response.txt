(define (problem put_task_spraybottles_garbagebin)
  (:domain put_task)

  (:objects
    robot - agent

    garbage_bin - receptacle
    spray_bottle1 spray_bottle2 - object
  )

  (:init
    ;; robot starts not at any object's location (so no atLocation facts for robot)

    ;; receptacle properties
    ;; garbage bin is a receptacle; not modeled as openable in this domain unless specified
    (inReceptacle spray_bottle1 garbage_bin)
    (inReceptacle spray_bottle2 garbage_bin)

    ;; robot is not holding anything initially
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle spray_bottle1 garbage_bin)
      (inReceptacle spray_bottle2 garbage_bin)
    )
  )
)