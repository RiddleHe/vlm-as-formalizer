(define (problem put_box_remote_on_couch)
  (:domain put_task)
  (:objects
    robot - agent

    box - receptacle
    couch - receptacle

    remote - object
  )

  (:init
    ;; robot initially not at any object's location (so no atLocation facts for robot)

    ;; receptacle relations from the scene
    (inReceptacle remote box)

    ;; assume couch can hold objects (as a receptacle in this domain)
  )

  (:goal
    (and
      (inReceptacle box couch)
      (inReceptacle remote box)
    )
  )
)