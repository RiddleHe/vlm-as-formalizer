(define (problem chill_apple_put_in_white_bin)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    microwave1 - microwave
    whitebin1 - receptacle

    apple1 - object
    knife1 - knife
  )

  (:init
    ;; receptacle properties
    (openable fridge1)
    ;; fridge1 is initially closed (so (opened fridge1) is not true)

    ;; object locations / containment
    ;; apple is on the counter (not inside any receptacle)
    ;; knife is on the counter (not inside any receptacle)
    ;; (no inReceptacle facts initially)

    ;; agent initially not at any object's location (no atLocation facts)
  )

  (:goal
    (and
      (isCool apple1)
      (inReceptacle apple1 whitebin1)
    )
  )
)