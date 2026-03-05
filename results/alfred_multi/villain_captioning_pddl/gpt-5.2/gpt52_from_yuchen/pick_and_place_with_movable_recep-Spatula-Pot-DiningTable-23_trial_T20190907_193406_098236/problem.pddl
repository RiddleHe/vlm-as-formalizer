(define (problem put_pot_spatula_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    table - receptacle
    pot_left pot_right - receptacle
    tray - receptacle

    knife1 - knife
    spatula - object
  )

  (:init
    ;; robot starts not at any object's location (no atLocation facts)

    ;; receptacle containment / support relations from the scene
    (inReceptacle knife1 table)
    (inReceptacle tray table)
    (inReceptacle spatula tray)

    ;; pots are on the stove (modeled as being in the stove area; stove itself not a domain object)
    ;; no explicit stove object in this domain problem; pots start as standalone receptacles
  )

  (:goal
    (and
      (inReceptacle spatula pot_left)
      (inReceptacle pot_left table)
    )
  )
)