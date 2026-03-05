(define (problem move_pen_to_dresser)
  (:domain put_task)
  (:objects
    robot - agent
    dresser - receptacle
    trash_bin - receptacle
    pen - object
    keys - object
    card_device - object
  )

  (:init
    ;; agent starts not at any object's location (no atLocation facts)

    ;; receptacle contents / placements from the scene
    (inReceptacle pen trash_bin)
    (inReceptacle keys dresser)
    (inReceptacle card_device dresser)
  )

  (:goal
    (and
      (inReceptacle pen dresser)
    )
  )
)