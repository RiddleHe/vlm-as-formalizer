(define (problem puttask_clean_fork_in_drawer)
  (:domain put_task)
  (:objects
    agent1 - agent
    fork1 - object
    sink1 - sink
    drawer1 - receptacle
  )

  (:init
    ;; Agent starts not at any object's location (no atLocation facts).

    ;; Object locations from the scene
    (inReceptacle fork1 drawer1)  ;; represent fork being at the drawer location (on/near drawer area)

    ;; Sink exists as a receptacle/location
    ;; (no objects initially in the sink)

    ;; Drawer is a receptacle (openable state unknown; not needed for task)
  )

  (:goal
    (and
      (isClean fork1)
      (inReceptacle fork1 drawer1)
    )
  )
)