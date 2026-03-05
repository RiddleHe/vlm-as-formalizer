(define (problem put_task_bathroom_sponge_toilet)
  (:domain put_task)
  (:objects
    robot - agent
    sponge_green - object
    toilet_tank - receptacle
  )
  (:init
    ;; receptacle properties
    (not (openable toilet_tank))
    (not (opened toilet_tank))

    ;; initial object locations (robot must navigate first)
    (atLocation robot sponge_green)

    ;; robot starts holding nothing
    (not (holdsAny robot))
  )
  (:goal
    (and
      (inReceptacle sponge_green toilet_tank)
    )
  )
)