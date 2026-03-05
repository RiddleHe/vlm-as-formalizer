(define (problem put_task_pen_to_dresser)
  (:domain put_task)
  (:objects
    robot - agent
    dresser - receptacle
    pen - object
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; object locations
    (atLocation robot pen)

    ;; pen is initially in the dresser (on/inside it)
    (inReceptacle pen dresser)
  )

  (:goal
    (and
      (inReceptacle pen dresser)
    )
  )
)