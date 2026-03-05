(define (problem put_remote_on_sofa_livingroom)
  (:domain put_task)

  (:objects
    robot - agent

    sofa - receptacle
    cardboard_box - receptacle

    remote - object
    stuffed_animal - object
    papers - object
    pillow - object
  )

  (:init
    ;; robot starts not at any object's location (so no atLocation facts for robot)

    ;; receptacles
    ;; (no openable/opened predicates observed)

    ;; object containment / placement (using inReceptacle to encode "on/in" a holder)
    (inReceptacle remote cardboard_box) ; remote is on the coffee table area; modeled as associated with the table-side receptacle
    (inReceptacle stuffed_animal cardboard_box)
    (inReceptacle papers cardboard_box)

    ;; sofa currently has a pillow on it
    (inReceptacle pillow sofa)
  )

  (:goal
    (and
      (inReceptacle remote sofa)
    )
  )
)