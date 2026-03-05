(define (problem put_task_cold_brown_ball_in_sink)
  (:domain put_task)
  (:objects
    robot - agent

    kitchen_sink - sink
    kitchen_fridge - fridge

    brown_ball - object
    knife1 knife2 - knife
    fork1 - object
    bottle1 - object
    sponge1 - object
    plantpot1 - object
  )

  (:init
    ;; receptacle properties
    (openable kitchen_fridge)
    ;; fridge is closed (not opened)

    ;; object locations
    (inReceptacle brown_ball kitchen_sink)

    ;; other objects (on counter / not in receptacles, modeled as individual locations)
    ;; (no inReceptacle assertions for these)

    ;; agent initially not at any object's location (no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle brown_ball kitchen_sink)
      (isCool brown_ball)
    )
  )
)