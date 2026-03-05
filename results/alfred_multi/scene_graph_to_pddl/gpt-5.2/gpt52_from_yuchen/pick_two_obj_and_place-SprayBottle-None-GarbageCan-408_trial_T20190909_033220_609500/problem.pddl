(define (problem put_task_spray_bottles_garbage_bin)
  (:domain put_task)
  (:objects
    ;; agent
    robot - agent

    ;; receptacles
    dark_gray_rectangular_sink - sink
    white_under_sink_cabinet - receptacle

    ;; objects
    gold_faucet_left - object
    gold_faucet_right - object
    green_soap_dispenser_bottle - object
  )

  (:init
    ;; receptacle properties
    (openable white_under_sink_cabinet)

    ;; robot initially not at any object's location (no atLocation facts)

    ;; no objects are initially held (no holds / holdsAny facts)

    ;; no inReceptacle relations are confirmed initially
  )

  ;; Note: The instruction requests placing TWO spray bottles into a garbage bin,
  ;; but the provided scene graph contains neither spray bottles nor a garbage bin.
  ;; Therefore the goal cannot be expressed with the available objects.
  (:goal
    (and)
  )
)