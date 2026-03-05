(define (problem wash_knife_return_shelf)
  (:domain put_task)

  (:objects
    robot - agent

    kitchen_sink - sink
    black_shelf - receptacle

    knife1 - knife
    fork1 spoon1 spoon2 saltshaker1 soapdispenser1
    apple_yellow apple_red1 apple_red2 - object
  )

  (:init
    ;; Robot initial state
    (not (holdsAny robot))

    ;; Receptacle properties
    (openable kitchen_sink)

    ;; Locations / containment (use inReceptacle to indicate items are on/in a receptacle)
    (inReceptacle knife1 black_shelf)
    (inReceptacle fork1 black_shelf)
    (inReceptacle spoon1 black_shelf)
    (inReceptacle saltshaker1 black_shelf)

    (inReceptacle spoon2 kitchen_sink)
    (inReceptacle apple_yellow kitchen_sink)
    (inReceptacle apple_red1 kitchen_sink)
    (inReceptacle apple_red2 kitchen_sink)

    ;; Countertop item (modeled as not in any receptacle; can still be a location)
    ;; soapdispenser1 is present near the sink (not required for the task)

    ;; No cleanliness facts given initially (knife is not known clean)
  )

  (:goal
    (and
      (isClean knife1)
      (inReceptacle knife1 black_shelf)
    )
  )
)