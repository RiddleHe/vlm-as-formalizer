(define (problem bathroom_put_towels_in_bathtub)
  (:domain put_task)

  (:objects
    robot - agent
    bathtub1 - sink
    sink1 - sink
    towel1 towel2 - object
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts)

    ;; Towels start at their own locations (not in any receptacle)
    (atLocation robot towel1)
    (atLocation robot towel2)
    ;; Note: per domain guidance, we do not place towels in receptacles initially.

    ;; Receptacle locations
    (atLocation robot bathtub1)
    (atLocation robot sink1)
  )

  (:goal
    (and
      (inReceptacle towel1 bathtub1)
      (inReceptacle towel2 bathtub1)
    )
  )
)