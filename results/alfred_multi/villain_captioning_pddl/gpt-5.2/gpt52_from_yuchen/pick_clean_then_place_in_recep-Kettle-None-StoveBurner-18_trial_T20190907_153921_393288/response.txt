(define (problem put_task_teapot_clean_on_stove)
  (:domain put_task)

  (:objects
    robot - agent

    kitchen_sink - sink
    stove - receptacle

    tea_pot - object
    funnel_strainer - object
    pot_pan - object
    fork - object
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; receptacles
    ;; sink is a receptacle (type sink). no open/close info in scene.
    ;; treat stove surface as a receptacle that can hold objects (not openable).

    ;; object locations / containment
    (inReceptacle tea_pot stove)
    (inReceptacle funnel_strainer stove)
    (inReceptacle pot_pan stove)
    ;; fork is on the counter; model as being in the stove receptacle is incorrect,
    ;; so we leave it as a standalone location reachable via GotoLocation.
    ;; (No inReceptacle relation asserted for fork.)

    ;; no object is currently held
    ;; (not (holdsAny robot)) is implicit by absence of holdsAny
  )

  (:goal
    (and
      (isClean tea_pot)
      (inReceptacle tea_pot stove)
    )
  )
)