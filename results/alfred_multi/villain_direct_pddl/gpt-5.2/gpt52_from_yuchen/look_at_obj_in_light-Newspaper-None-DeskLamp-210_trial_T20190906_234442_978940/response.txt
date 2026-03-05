(define (problem put_task_scene1)
  (:domain put_task)
  (:objects
    robot - agent
    sofa - receptacle
    newspaper - object
    lamp - object
  )

  (:init
    ;; robot starts not at any object's location (no atLocation facts for robot)

    ;; object locations / containment from the scene
    (inReceptacle newspaper sofa)

    ;; lamp is initially off (not asserting (isOn lamp))
  )

  (:goal
    (and
      (holds robot newspaper)
      (isOn lamp)
    )
  )
)