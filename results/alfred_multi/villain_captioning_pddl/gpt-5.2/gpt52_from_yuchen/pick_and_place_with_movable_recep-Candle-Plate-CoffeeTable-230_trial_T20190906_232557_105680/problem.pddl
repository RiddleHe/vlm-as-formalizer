(define (problem put_grey_plate_candle_on_coffee_table)
  (:domain put_task)

  (:objects
    robot - agent

    dining_table - receptacle
    coffee_table - receptacle

    grey_plate1 - object
    grey_plate2 - object
    candle1 - object
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; objects on dining table
    (inReceptacle grey_plate1 dining_table)
    (inReceptacle grey_plate2 dining_table)
    (inReceptacle candle1 dining_table)
  )

  (:goal
    (and
      ;; a grey plate with a candle on it on the coffee table
      (inReceptacle grey_plate1 coffee_table)
      (inReceptacle candle1 grey_plate1)
    )
  )
)