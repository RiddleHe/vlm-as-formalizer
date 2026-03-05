(define (problem put_task_scene)
  (:domain put_task)

  (:objects
    robot - agent
    lamp - object
    cushion - object
  )

  (:init
    ;; Robot starts not at any object's location (so no atLocation facts for robot)

    ;; Scene objects exist; no receptacles are needed for this task.
  )

  (:goal
    (and
      ;; "Look at a cushion by the light of a lamp." -> be at the cushion and have the lamp turned on.
      (atLocation robot cushion)
      (isOn lamp)
    )
  )
)