(define (problem put_glass_knife_on_shelf)
  (:domain put_task)
  (:objects
    robot - agent
    shelf - receptacle
    knife1 - knife
    glass1 - object
  )

  (:init
    ;; receptacle properties
    (openable shelf)

    ;; object locations (robot starts at no location)
    (inReceptacle knife1 shelf)
    (atLocation robot shelf)
  )

  (:goal
    (and
      (inReceptacle glass1 shelf)
      (inReceptacle knife1 shelf)
    )
  )
)