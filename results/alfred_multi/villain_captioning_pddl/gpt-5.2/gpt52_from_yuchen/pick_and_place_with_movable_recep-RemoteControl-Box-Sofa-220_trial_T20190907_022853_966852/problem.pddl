(define (problem put_box_with_remote_on_couch)
  (:domain put_task)

  (:objects
    robot - agent

    box1 - receptacle
    couch1 - receptacle
    table1 - receptacle

    remote1 remote2 - object
    tissuebox1 candle1 blueitem1 - object
  )

  (:init
    ;; receptacle properties
    (openable box1)
    (opened box1)

    ;; object placements / locations
    (inReceptacle box1 table1)
    (inReceptacle remote1 table1)
    (inReceptacle remote2 table1)
    (inReceptacle tissuebox1 table1)
    (inReceptacle candle1 table1)
    (inReceptacle blueitem1 table1)

    ;; agent initially holds nothing and is not at any location (no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle remote1 box1)
      (inReceptacle box1 couch1)
    )
  )
)