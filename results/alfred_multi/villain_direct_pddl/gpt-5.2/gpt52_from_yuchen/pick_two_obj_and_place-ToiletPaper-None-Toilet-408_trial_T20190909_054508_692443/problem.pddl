(define (problem bathroom_toiletpaper_on_toiletback)
  (:domain put_task)
  (:objects
    robot - agent

    toilet - receptacle
    trashcan - receptacle

    toiletpaper_empty - object
    toiletpaper_full - object
  )

  (:init
    ;; robot initially not at any location (no atLocation facts)

    ;; receptacle relationships / contents from the scene
    (inReceptacle toiletpaper_empty trashcan)

    ;; toilet can hold objects (treat as receptacle); not openable in this domain instance
  )

  (:goal
    (and
      (inReceptacle toiletpaper_empty toilet)
      (inReceptacle toiletpaper_full toilet)
    )
  )
)