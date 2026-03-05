(define (problem move-watch-to-small-wooden-table)
  (:domain put_task)

  (:objects
    robot - agent

    small_wooden_table - receptacle
    tv_stand - receptacle

    watch - object
    remote_control - object
    card - object
    statue - object
    ring1 - object
    ring2 - object
    ring3 - object
    newspaper - object
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts)

    ;; Receptacles present (none are openable/opened in the scene)

    ;; Object placements (modeled via inReceptacle as "on/at" the surface receptacle)
    (inReceptacle watch tv_stand)
    (inReceptacle remote_control tv_stand)
    (inReceptacle card tv_stand)
    (inReceptacle statue tv_stand)
    (inReceptacle ring1 tv_stand)
    (inReceptacle ring2 tv_stand)
    (inReceptacle ring3 tv_stand)

    (inReceptacle newspaper small_wooden_table)
  )

  (:goal
    (and
      (inReceptacle watch small_wooden_table)
    )
  )
)