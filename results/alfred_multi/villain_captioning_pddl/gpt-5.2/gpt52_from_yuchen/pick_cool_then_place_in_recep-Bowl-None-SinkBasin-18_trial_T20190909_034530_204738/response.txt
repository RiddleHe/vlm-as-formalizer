(define (problem put_task_chilled_black_bowl_in_sink)
  (:domain put_task)

  (:objects
    robot - agent
    sink1 - sink
    fridge1 - fridge
    black_bowl1 - object
  )

  (:init
    ;; Receptacle properties
    (openable fridge1)

    ;; Object locations (agent must navigate before interacting)
    (inReceptacle black_bowl1 fridge1)

    ;; No initial agent location is specified per instruction.
    ;; Robot starts holding nothing (no holds/holdsAny facts).

    ;; Chilled requirement from instruction
    (isCool black_bowl1)
  )

  (:goal
    (and
      (inReceptacle black_bowl1 sink1)
    )
  )
)