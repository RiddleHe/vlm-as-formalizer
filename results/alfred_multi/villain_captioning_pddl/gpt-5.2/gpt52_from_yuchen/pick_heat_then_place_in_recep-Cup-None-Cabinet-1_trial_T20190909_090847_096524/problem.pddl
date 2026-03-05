(define (problem put-hot-glass-in-cabinet)
  (:domain put_task)
  (:objects
    robot - agent

    kitchen_sink - sink
    kitchen_cabinet - receptacle
    kitchen_microwave - microwave

    glass_1 glass_2 glass_3 - object
    bottle_1 - object
    brown_round_item - object
  )

  (:init
    ;; Receptacle properties
    (openable kitchen_cabinet)

    ;; Robot initially not at any object's location (no atLocation facts)

    ;; Objects in the sink
    (inReceptacle glass_1 kitchen_sink)
    (inReceptacle glass_2 kitchen_sink)
    (inReceptacle glass_3 kitchen_sink)
    (inReceptacle bottle_1 kitchen_sink)
    (inReceptacle brown_round_item kitchen_sink)
  )

  (:goal
    (and
      ;; A hot glass is inside the cabinet
      (inReceptacle glass_1 kitchen_cabinet)
      (isHot glass_1)
    )
  )
)