(define (problem put_task_statues_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    table1 - receptacle
    statue1 statue2 statue3 - object
  )

  (:init
    ;; receptacle properties
    ;; (openable ...) not applicable/visible for the table

    ;; robot initially not at any object's location
    (not (atLocation robot table1))
    (not (atLocation robot statue1))
    (not (atLocation robot statue2))
    (not (atLocation robot statue3))

    ;; initial object placements (statues are on the table, modeled as inReceptacle)
    (inReceptacle statue1 table1)
    (inReceptacle statue2 table1)
    (inReceptacle statue3 table1)

    ;; robot hand initially empty
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle statue1 table1)
      (inReceptacle statue2 table1)
    )
  )
)