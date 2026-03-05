(define (problem put_two_cushions_on_ottoman)
  (:domain put_task)
  (:objects
    robot - agent

    ottoman_1 - receptacle

    cushion_1 cushion_2 - object
    sofa_1 chair_1 - object
    remote_1 smallobject_1 - object
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; receptacle relations (items currently on/in surfaces treated as inReceptacle)
    (inReceptacle cushion_1 chair_1)
    (inReceptacle cushion_2 sofa_1)

    (inReceptacle remote_1 sofa_1)
    (inReceptacle smallobject_1 ottoman_1)

    ;; ottoman is not openable (no openable/opened predicates)
  )

  (:goal
    (and
      (inReceptacle cushion_1 ottoman_1)
      (inReceptacle cushion_2 ottoman_1)
    )
  )
)