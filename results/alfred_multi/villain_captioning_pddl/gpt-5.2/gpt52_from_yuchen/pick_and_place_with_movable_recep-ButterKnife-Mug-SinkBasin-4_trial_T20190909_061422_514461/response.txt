(define (problem kitchen_clean_put_in_sink)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 - sink
    microwave1 - microwave

    knife1 - knife
    mug1 - object
  )

  (:init
    ;; Receptacle properties
    ;; (openable microwave1) is not asserted because the scene/caption does not confirm it is openable
    ;; sink is a receptacle by type; no open/close state used

    ;; Robot starts not holding anything and not at any location (no atLocation facts)
    ;; Knife and mug are on the table (modeled as being at their own locations)
    ;; Not in any receptacle initially (no inReceptacle facts)

    ;; No cleanliness is given initially (so isClean not asserted)
  )

  (:goal
    (and
      (isClean knife1)
      (isClean mug1)
      (inReceptacle knife1 sink1)
      (inReceptacle mug1 sink1)
    )
  )
)