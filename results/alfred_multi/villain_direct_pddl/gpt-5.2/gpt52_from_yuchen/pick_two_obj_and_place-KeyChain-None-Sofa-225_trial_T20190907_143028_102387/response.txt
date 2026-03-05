(define (problem put_task_keys_on_couch)
  (:domain put_task)

  (:objects
    robot - agent

    couch - receptacle
    table - receptacle

    keys1 keys2 - object
  )

  (:init
    ;; receptacles and their properties
    (openable couch)
    (openable table)

    ;; object placements (keys start on the table)
    (inReceptacle keys1 table)
    (inReceptacle keys2 table)

    ;; robot initially holds nothing and is not at any object location
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle keys1 couch)
      (inReceptacle keys2 couch)
    )
  )
)