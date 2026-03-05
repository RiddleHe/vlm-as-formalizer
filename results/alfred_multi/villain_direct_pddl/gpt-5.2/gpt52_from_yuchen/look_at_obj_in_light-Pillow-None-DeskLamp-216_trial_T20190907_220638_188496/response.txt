(define (problem put_task_scene1)
  (:domain put_task)

  (:objects
    robot - agent
    lamp1 pillow1 tissuebox1 plate1 table1 armchair1 - object
  )

  (:init
    ;; receptacle info (none of the visible items are modeled as receptacles in this domain)
    ;; locations
    (atLocation robot table1)
    (atLocation robot lamp1)
    (atLocation robot tissuebox1)
    (atLocation robot plate1)

    ;; object placements
    (inReceptacle lamp1 table1)
    (inReceptacle tissuebox1 table1)
    (inReceptacle plate1 table1)

    ;; pillow is on the armchair
    (atLocation robot armchair1)
    (atLocation robot pillow1)
    (inReceptacle pillow1 armchair1)

    ;; robot starts holding nothing
    (not (holdsAny robot))

    ;; lamp initially off (not isOn)
    (not (isOn lamp1))
  )

  (:goal
    (and
      (holds robot pillow1)
      (isOn lamp1)
      (isToggled lamp1)
    )
  )
)