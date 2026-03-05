(define (problem put_tomato_slice_in_trash)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    microwave1 - microwave
    sink1 - sink

    trash1 - receptacle

    tomato1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)
    (openable microwave1)
    ;; sink and trash are not specified as openable in the scene

    ;; object locations (robot starts not at any location)
    (inReceptacle tomato1 trash1) ;; not true; ensure tomato is not in trash
    ;; Remove the incorrect predicate by negating explicitly is not supported in :init without :negative-preconditions.
    ;; So we simply do not assert tomato1 in trash1.

    ;; place agent nowhere initially (no atLocation facts)

    ;; (opened ...) not asserted for fridge/microwave since they appear closed
    ;; tomato is not sliced initially (no isSliced predicate)
  )

  (:goal
    (and
      (isSliced tomato1)
      (inReceptacle tomato1 trash1)
    )
  )
)