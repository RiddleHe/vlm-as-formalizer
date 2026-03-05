(define (problem put_task_watches_on_tvstand)
  (:domain put_task)
  (:objects
    robot - agent

    tvstand - receptacle

    watch1 - object
    watch2 - object
    watch3 - object

    diningtable - receptacle
  )

  (:init
    ;; receptacles / containment
    (inReceptacle watch1 diningtable)
    (inReceptacle watch2 diningtable)
    (inReceptacle watch3 diningtable)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle watch1 tvstand)
      (inReceptacle watch2 tvstand)
    )
  )
)