(define (problem bathroom_rinse_cloth_put_in_cabinet)
  (:domain put_task)
  (:objects
    robot - agent

    sink1 - sink
    cabinet1 - receptacle

    cloth1 - object
    soap1 - object
    bottle1 - object
    candle1 - object
    trashbin1 - object
  )

  (:init
    ;; receptacle properties / states
    (openable cabinet1)
    ;; cabinet appears closed
    (not (opened cabinet1))

    ;; object locations (robot must navigate first; robot starts at no location)
    (atLocation robot sink1)
    (atLocation robot soap1)

    ;; countertop items (modeled as their own locations for interaction)
    (atLocation robot cloth1)
    (atLocation robot bottle1)
    (atLocation robot candle1)

    ;; trash bin location
    (atLocation robot trashbin1)

    ;; in-receptacle relationships observed
    (inReceptacle soap1 sink1)

    ;; robot starts holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isClean cloth1)
      (inReceptacle cloth1 cabinet1)
    )
  )
)