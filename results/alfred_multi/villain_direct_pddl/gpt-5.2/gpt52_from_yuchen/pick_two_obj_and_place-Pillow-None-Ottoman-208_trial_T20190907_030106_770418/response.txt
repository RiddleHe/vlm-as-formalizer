(define (problem put_two_cushions_on_ottoman)
  (:domain put_task)
  (:objects
    robot - agent
    ottoman1 - receptacle
    cushion1 cushion2 - object
  )

  (:init
    ;; robot starts not at any object's location (no atLocation facts)

    ;; scene layout: two cushions are on the sofas/chairs (not on the ottoman yet)
    ;; represent this as being in other (unspecified) receptacles to avoid them
    ;; being already in the ottoman.
    (inReceptacle cushion1 cushion2)  ; placeholder container relation to indicate not in ottoman1
  )

  (:goal
    (and
      (inReceptacle cushion1 ottoman1)
      (inReceptacle cushion2 ottoman1)
    )
  )
)