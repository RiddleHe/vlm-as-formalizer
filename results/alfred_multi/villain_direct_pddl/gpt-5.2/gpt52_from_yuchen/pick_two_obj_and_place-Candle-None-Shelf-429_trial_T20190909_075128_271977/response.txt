(define (problem bathroom_candles_shelf)
  (:domain put_task)
  (:objects
    robot - agent
    candle1 candle2 - object
    shelf1 - receptacle
  )
  (:init
    ;; initial object locations
    (atLocation robot candle1)
    (atLocation robot candle2)

    ;; candles are currently on the shelf area (shelf is the target receptacle)
    ;; (left unspecified whether they start in the shelf; task is to ensure they are on it)

    ;; shelf is a receptacle (can hold objects)
    ;; not openable in this scene
  )
  (:goal
    (and
      (inReceptacle candle1 shelf1)
      (inReceptacle candle2 shelf1)
    )
  )
)