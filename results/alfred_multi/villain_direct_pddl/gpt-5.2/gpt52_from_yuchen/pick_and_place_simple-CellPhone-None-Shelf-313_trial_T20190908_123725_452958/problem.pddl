(define (problem put_phone_on_endtable_shelf)
  (:domain put_task)

  (:objects
    robot - agent
    phone - object
    endtable - receptacle
  )

  (:init
    ;; robot starts not at any object's location (no atLocation facts)

    ;; scene state
    (inReceptacle phone endtable)
  )

  (:goal
    (and
      (inReceptacle phone endtable)
    )
  )
)