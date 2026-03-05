(define (problem put_racket_on_dresser)
  (:domain put_task)

  (:objects
    robot - agent
    dresser - receptacle
    racket - object
  )

  (:init
    ;; robot starts not at any object's location (so no atLocation facts)

    ;; initial object locations (treating "on" as being in a receptacle per domain modeling)
    (inReceptacle racket dresser)
  )

  (:goal
    (and
      (inReceptacle racket dresser)
    )
  )
)