(define (problem put_task_cushion_lamp)
  (:domain put_task)
  (:objects
    robot - agent
    bed - receptacle
    nightstand - receptacle
    lamp - object
    cushion - object
  )
  (:init
    ;; receptacle relations
    (inReceptacle cushion bed)
    (inReceptacle lamp nightstand)

    ;; robot starts with no location and holds nothing
    (not (holdsAny robot))

    ;; lamp initially off (so it must be toggled to provide light)
    (not (isOn lamp))
  )
  (:goal
    (and
      ;; be at the cushion and have the lamp turned on (by its light)
      (atLocation robot cushion)
      (isOn lamp)
      (isToggled lamp)
    )
  )
)