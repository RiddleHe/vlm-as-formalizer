(define (problem put_keys_on_loveseat)
  (:domain put_task)
  (:objects
    robot - agent
    loveseat - receptacle
    sidetable - receptacle
    keys - object
  )

  (:init
    ;; receptacle relations from the scene
    (inReceptacle keys sidetable)

    ;; robot starts not at any object location (so no atLocation facts initially)
  )

  (:goal
    (and
      (inReceptacle keys loveseat)
    )
  )
)