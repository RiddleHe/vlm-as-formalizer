(define (problem put_pump_bottle_in_garbage)
  (:domain put_task)
  (:objects
    robot - agent
    garbage_can - receptacle
    pump_bottle - object
  )
  (:init
    ;; receptacle relations
    (inReceptacle pump_bottle garbage_can)
  )
  (:goal
    (and
      (inReceptacle pump_bottle garbage_can)
    )
  )
)