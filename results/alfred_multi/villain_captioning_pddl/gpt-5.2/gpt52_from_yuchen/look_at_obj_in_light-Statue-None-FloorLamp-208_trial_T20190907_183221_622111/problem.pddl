(define (problem examine_trophy_with_lamp)
  (:domain put_task)

  (:objects
    robot - agent
    trophy - object
    lamp - object
    console_table - object
  )

  (:init
    ;; Robot starts not at any object's location and holds nothing
    (not (holdsAny robot))

    ;; Scene layout (table-like support expressed as inReceptacle per domain)
    (inReceptacle trophy console_table)
    (atLocation robot trophy)
  )

  (:goal
    (and
      ;; "examine a trophy with a lamp" approximated in this domain by being at both items
      (atLocation robot trophy)
      (atLocation robot lamp)
    )
  )
)