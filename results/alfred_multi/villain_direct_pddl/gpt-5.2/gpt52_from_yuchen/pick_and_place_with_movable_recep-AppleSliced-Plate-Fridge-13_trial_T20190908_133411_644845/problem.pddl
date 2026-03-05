(define (problem put_plate_knife_applepiece_in_fridge)
  (:domain put_task)

  (:objects
    agent0 - agent

    fridge0 - fridge
    microwave0 - microwave
    sink0 - sink

    plate0 - receptacle
    knife0 - knife
    apple_piece0 - object
  )

  (:init
    ;; receptacle properties (from domain knowledge)
    (openable fridge0)
    (openable microwave0)

    ;; robot initially holds nothing and is not at any location (per instruction)
    ;; scene relationships
    (inReceptacle knife0 plate0)
    (inReceptacle apple_piece0 plate0)
  )

  (:goal
    (and
      (inReceptacle plate0 fridge0)
      (inReceptacle knife0 plate0)
      (inReceptacle apple_piece0 plate0)
    )
  )
)