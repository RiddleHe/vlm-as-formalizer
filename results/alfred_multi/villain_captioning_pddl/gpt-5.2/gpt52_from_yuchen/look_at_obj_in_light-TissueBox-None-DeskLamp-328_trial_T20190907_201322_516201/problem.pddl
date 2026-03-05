(define (problem put_task_desk_lamp_tissues)
  (:domain put_task)

  (:objects
    robot - agent

    desk_lamp - object
    tissue_box_left - object
    tissue_box_center - object

    alarm_clock - object
    pencil_left - object
    pencil_right - object
    keys - object
    chair - object
    dumbbell - object
    drawers_unit - object
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts)

    ;; No receptacles are required/used for this task, and no objects are initially in any receptacle.
    ;; Lamp is initially off (so isOn is not asserted).
  )

  (:goal
    (and
      (isOn desk_lamp)
      (holds robot tissue_box_center)
    )
  )
)