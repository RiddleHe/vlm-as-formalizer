(define (problem put_task_scene1)
  (:domain put_task)
  (:objects
    robot - agent

    wooden_nightstand_top - receptacle
    wooden_nightstand_bottom - receptacle

    black_handled_knife - knife
    yellow_pencil - object
    small_blue_card - object
    digital_clock_device - object
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; receptacle contents from scene graph
    (inReceptacle black_handled_knife wooden_nightstand_top)
    (inReceptacle yellow_pencil wooden_nightstand_top)
    (inReceptacle small_blue_card wooden_nightstand_top)
    (inReceptacle digital_clock_device wooden_nightstand_bottom)
  )

  (:goal
    (and
      (holds robot yellow_pencil)
    )
  )
)