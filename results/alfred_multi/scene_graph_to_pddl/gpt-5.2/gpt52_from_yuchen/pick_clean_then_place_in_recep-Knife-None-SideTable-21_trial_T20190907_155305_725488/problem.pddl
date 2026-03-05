(define (problem wash_knife_return_shelf)
  (:domain put_task)

  (:objects
    robot - agent

    white-sink-basin - sink

    black-side-table - receptacle

    silver-knife_black-table - knife
    silver-knife_sink - knife

    silver-fork_black-table - object
    silver-spoon_black-table - object
    clear-salt-shaker_black-table - object
    yellow-apple_black-table - object
    yellow-apple_sink - object
    red-apple_top_sink - object
    red-apple_bottom_sink - object
    silver-spoon_counter - object
    soap-dispenser-bottle - object
  )

  (:init
    ;; receptacle contents
    (inReceptacle silver-fork_black-table black-side-table)
    (inReceptacle silver-spoon_black-table black-side-table)
    (inReceptacle clear-salt-shaker_black-table black-side-table)
    (inReceptacle yellow-apple_black-table black-side-table)
    (inReceptacle silver-knife_black-table black-side-table)

    (inReceptacle yellow-apple_sink white-sink-basin)
    (inReceptacle red-apple_top_sink white-sink-basin)
    (inReceptacle red-apple_bottom_sink white-sink-basin)
    (inReceptacle silver-knife_sink white-sink-basin)

    ;; robot starts not holding anything and not at any location (no atLocation facts)
  )

  (:goal
    (and
      (isClean silver-knife_black-table)
      (inReceptacle silver-knife_black-table black-side-table)
    )
  )
)