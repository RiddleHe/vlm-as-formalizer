(define (problem put_task_statues_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    table - receptacle

    statue1 statue2 statue3 - object
  )

  (:init
    ;; robot starts not at any object location (no atLocation facts for robot)

    ;; statues are currently in the table (on the table surface)
    (inReceptacle statue1 table)
    (inReceptacle statue2 table)
    (inReceptacle statue3 table)
  )

  (:goal
    (and
      (inReceptacle statue1 table)
      (inReceptacle statue2 table)
    )
  )
)