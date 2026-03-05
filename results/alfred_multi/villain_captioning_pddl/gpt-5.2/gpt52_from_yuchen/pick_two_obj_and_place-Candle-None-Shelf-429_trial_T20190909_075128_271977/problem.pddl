(define (problem put_two_candles_on_shelf)
  (:domain put_task)
  (:objects
    robot - agent

    candle1 candle2 - object
    shelf1 - receptacle
  )

  (:init
    ;; Robot starts not at any location (no atLocation facts)

    ;; Scene: two candles are present; a shelf is available as a receptacle
    ;; Candles are initially not on the shelf
    (not (inReceptacle candle1 shelf1))
    (not (inReceptacle candle2 shelf1))
  )

  (:goal
    (and
      (inReceptacle candle1 shelf1)
      (inReceptacle candle2 shelf1)
    )
  )
)