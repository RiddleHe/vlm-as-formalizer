(define (problem put_task_scene1)
  (:domain put_task)

  (:objects
    robot - agent
    lamp - object
    newspaper - object
    sofa - object
    sidetable - object
  )

  (:init
    ;; Robot starts not at any object's location and holds nothing.

    ;; Scene placement (modeled via inReceptacle to allow co-location effects in GotoLocation)
    (inReceptacle lamp sidetable)
    (inReceptacle newspaper sofa)

    ;; Lamp can be toggled; assume initially off (so no (isOn lamp))
  )

  (:goal
    (and
      (holds robot newspaper)
      (isOn lamp)
      (isToggled lamp)
    )
  )
)