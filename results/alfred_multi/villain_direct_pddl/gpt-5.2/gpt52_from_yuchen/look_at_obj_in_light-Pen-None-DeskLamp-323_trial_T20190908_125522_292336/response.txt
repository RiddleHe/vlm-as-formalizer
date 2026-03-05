(define (problem put_task_pencil_lamp)
  (:domain put_task)

  (:objects
    robot - agent
    pencil - object
    lamp - object
    drawer - receptacle
  )

  (:init
    ;; receptacle properties
    (openable drawer)

    ;; object locations (robot starts not at any location)
    (atLocation robot drawer)
    (inReceptacle pencil drawer)

    ;; lamp is on the nightstand (not a receptacle in this domain)
    (atLocation robot lamp)
  )

  (:goal
    (and
      ;; interpret "look at it under the lamp" as having the pencil placed with the lamp
      (atLocation robot lamp)
      (inReceptacle pencil lamp)
    )
  )
)