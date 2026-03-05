(define (problem put_task_keys_to_table)
  (:domain put_task)

  (:objects
    robot - agent

    dresser - receptacle
    white_table - receptacle

    keys1 - object
    keys2 - object
  )

  (:init
    ;; receptacles
    (inReceptacle keys1 dresser)
    (inReceptacle keys2 dresser)

    ;; robot starts not holding anything (and not at any location)
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle keys1 white_table)
      (inReceptacle keys2 white_table)
    )
  )
)