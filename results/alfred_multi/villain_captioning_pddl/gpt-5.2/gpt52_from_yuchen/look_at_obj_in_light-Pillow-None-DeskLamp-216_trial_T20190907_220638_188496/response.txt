(define (problem livingroom_pillow_lamp)
  (:domain put_task)

  (:objects
    robot - agent
    side_table - receptacle
    lamp - object
    pillow - object
    tissue_box - object
    dish - object
  )

  (:init
    ;; receptacle properties
    ;; side_table is a receptacle but not openable in this scene

    ;; object containment / support
    (inReceptacle lamp side_table)
    (inReceptacle tissue_box side_table)
    (inReceptacle dish side_table)

    ;; agent starts not at any object location and holds nothing
    ;; (no atLocation facts initially)
    ;; (holdsAny robot) is false by omission
  )

  (:goal
    (and
      (holds robot pillow)
      (isOn lamp)
    )
  )
)