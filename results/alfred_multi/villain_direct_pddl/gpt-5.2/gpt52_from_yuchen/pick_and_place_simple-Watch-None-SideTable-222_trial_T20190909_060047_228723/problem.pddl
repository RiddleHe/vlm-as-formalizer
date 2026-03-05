(define (problem move_watch_to_small_wooden_table)
  (:domain put_task)
  (:objects
    robot - agent
    watch - object
    tv_stand - receptacle
    small_wooden_table - receptacle
  )

  (:init
    ;; receptacles
    (inReceptacle watch tv_stand)

    ;; robot initially not at any object's location (no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle watch small_wooden_table)
    )
  )
)