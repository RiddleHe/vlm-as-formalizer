(define (problem put_task_candle_in_drawer)
  (:domain put_task)

  (:objects
    agent1 - agent

    white-rectangular-sink-basin - sink

    small-beige-candle-in-gold-holder - object
    pink-soap-bar - object
    pink-soap-dispenser-left - object
    pink-soap-dispenser-right - object
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; scene state
    (inReceptacle pink-soap-bar white-rectangular-sink-basin)
  )

  ;; Instruction: Putting a candle in a drawer
  ;; Note: no drawer (openable receptacle) exists in the provided scene graph,
  ;; so this goal cannot be expressed with available objects.
  (:goal
    (and
      ;; impossible to specify "in a drawer" given current objects
    )
  )
)