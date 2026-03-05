(define (problem put_task_clean_fork_in_drawer)
  (:domain put_task)
  (:objects
    robot - agent

    sink_basin_with_faucet - sink

    metal_fork_on_upper_shelf_right - object
  )

  (:init
    ;; Robot starts not at any location (no atLocation facts).

    ;; No objects are initially in any receptacle (no inReceptacle facts).
    ;; No objects are initially clean/heated/cooled/toggled/sliced (no such facts).
  )

  (:goal
    (and
      (isClean metal_fork_on_upper_shelf_right)
      ;; Interpreting "drawer" as the only available receptacle in the scene: the sink.
      (inReceptacle metal_fork_on_upper_shelf_right sink_basin_with_faucet)
    )
  )
)