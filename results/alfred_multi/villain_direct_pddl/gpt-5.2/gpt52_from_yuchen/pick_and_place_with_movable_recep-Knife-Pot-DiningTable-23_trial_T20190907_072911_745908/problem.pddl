(define (problem put_task_pan_knife_table)
  (:domain put_task)

  (:objects
    robot - agent

    table - receptacle
    fridge - fridge
    microwave - microwave
    sink - sink

    pan - receptacle
    knife - knife
  )

  (:init
    ;; receptacle properties
    (openable fridge)
    (openable microwave)
    ;; (sink) and (table) and (pan) are receptacles but not openable

    ;; initial object placements from the scene
    (inReceptacle pan microwave)     ; pan is on/inside the microwave (treated as receptacle)
    (atLocation robot fridge)        ; robot starts somewhere not useful; not at table/pan/knife

    ;; knife starts on the table
    (inReceptacle knife table)
  )

  (:goal
    (and
      (inReceptacle pan table)
      (inReceptacle knife pan)
    )
  )
)