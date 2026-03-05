(define (problem put_two_sponges_in_tub)
  (:domain put_task)

  (:objects
    robot - agent

    tub - sink
    sponge_green - object
    sponge_green2 - object
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; object locations
    (atLocation robot sponge_green)
    (atLocation robot sponge_green2)

    ;; sponges start out not in the tub (no inReceptacle facts)
  )

  (:goal
    (and
      (inReceptacle sponge_green tub)
      (inReceptacle sponge_green2 tub)
    )
  )
)