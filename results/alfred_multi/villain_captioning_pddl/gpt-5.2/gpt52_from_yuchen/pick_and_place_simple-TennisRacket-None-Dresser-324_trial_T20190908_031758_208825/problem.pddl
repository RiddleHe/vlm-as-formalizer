(define (problem put_racket_on_dresser)
  (:domain put_task)

  (:objects
    robot - agent
    dresser1 - receptacle
    racket1 - object
    laptop1 - object
    lamp1 - object
    pillow1 - object
    pillow2 - object
    bed1 - object
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts for robot)

    ;; Objects currently on/in the dresser (treated as being in the receptacle)
    (inReceptacle laptop1 dresser1)
    (inReceptacle lamp1 dresser1)

    ;; No objects are held initially
    ;; (holdsAny robot) is not set
  )

  (:goal
    (and
      (inReceptacle racket1 dresser1)
    )
  )
)