(define (problem rinse-pan)
  (:domain put_task)

  (:objects
    robot - agent
    sink1 - sink
    microwave1 - microwave
    pan1 - object
  )

  (:init
    ;; Robot starts not at any object's location and holds nothing
    (not (holdsAny robot))

    ;; Receptacles present
    ;; sink is not openable in this domain description (no predicate asserted)
    (openable microwave1)
    (not (opened microwave1))

    ;; Object containment (none specified in scene)
    (not (inReceptacle pan1 sink1))
    (not (inReceptacle pan1 microwave1))

    ;; No initial location facts for the robot (per instruction)
  )

  (:goal
    (and
      (isClean pan1)
    )
  )
)