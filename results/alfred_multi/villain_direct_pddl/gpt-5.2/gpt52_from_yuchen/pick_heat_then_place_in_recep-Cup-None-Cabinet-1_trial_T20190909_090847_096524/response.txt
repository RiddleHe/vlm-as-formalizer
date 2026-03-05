(define (problem put_hot_glass_in_cabinet)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 - sink
    microwave1 - microwave

    cabinet1 - receptacle

    glass1 - object
    glass2 - object
    bottle1 - object
    sponge1 - object
  )

  (:init
    ;; receptacle properties
    (openable cabinet1)

    ;; object containment / locations from the scene
    (inReceptacle glass1 sink1)
    (inReceptacle glass2 sink1)
    (inReceptacle bottle1 sink1)
    (inReceptacle sponge1 sink1)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isHot glass1)
      (inReceptacle glass1 cabinet1)
    )
  )
)