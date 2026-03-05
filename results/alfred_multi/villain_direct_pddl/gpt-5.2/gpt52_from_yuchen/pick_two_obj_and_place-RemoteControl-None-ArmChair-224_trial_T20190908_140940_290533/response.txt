(define (problem put_task_remotes_to_chair_seat)
  (:domain put_task)

  (:objects
    robot - agent

    remote1 remote2 - object
    chair - receptacle
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts)

    ;; Object locations
    (atLocation robot remote1)
    (atLocation robot remote2)

    ;; Both remotes are currently on the sofa area; represent as not being in any receptacle initially
    ;; (No inReceptacle assertions initially)

    ;; Chair seat is treated as a receptacle that can hold objects
  )

  (:goal
    (and
      (inReceptacle remote1 chair)
      (inReceptacle remote2 chair)
    )
  )
)