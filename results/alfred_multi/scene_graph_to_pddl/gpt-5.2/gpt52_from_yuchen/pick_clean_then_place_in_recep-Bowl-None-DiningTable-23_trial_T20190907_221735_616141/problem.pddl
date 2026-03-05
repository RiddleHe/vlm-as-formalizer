(define (problem put_task_pan_water_island)
  (:domain put_task)

  (:objects
    robot - agent

    black-fridge-left-of-sink - fridge
    silver-sink-basin - sink

    silver-metal-pan - receptacle
    square-bowl-1 - receptacle
    square-bowl-2 - receptacle
    clear-glass-bottle-carafe - receptacle

    table-knife - knife

    green-wine-bottle-1 - object
    green-wine-bottle-2 - object
    metal-spoon - object
    metal-fork - object
    red-round-fruit - object
  )

  (:init
    (openable black-fridge-left-of-sink)
    ;; no receptacles are initially opened
    ;; robot initially not at any location (no atLocation facts)
    ;; nothing is initially in any receptacle (no inReceptacle facts)
  )

  (:goal
    (and
      ;; "fill the pan with water" modeled as having water (carafe) in the pan
      (inReceptacle clear-glass-bottle-carafe silver-metal-pan)

      ;; "put the pan on the kitchen island" modeled as pan placed in the island container (a bowl)
      (inReceptacle silver-metal-pan square-bowl-1)
    )
  )
)