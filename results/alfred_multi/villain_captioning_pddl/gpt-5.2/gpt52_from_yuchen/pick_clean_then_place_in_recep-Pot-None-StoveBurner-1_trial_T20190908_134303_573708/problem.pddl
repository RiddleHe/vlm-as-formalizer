(define (problem put_task_kitchen_pot_on_stove)
  (:domain put_task)

  (:objects
    robot - agent
    stove - receptacle
    sink1 - sink
    pot1 pot2 - receptacle
  )

  (:init
    ;; robot initially not at any object's location (so no atLocation facts)

    ;; receptacle containment / placements from the scene
    (inReceptacle pot1 stove)
    (inReceptacle pot2 stove)

    ;; no openable/ opened states are visible or required
  )

  (:goal
    (and
      ;; a pot is on/in the stove receptacle (already true in this scene)
      (inReceptacle pot1 stove)
    )
  )
)