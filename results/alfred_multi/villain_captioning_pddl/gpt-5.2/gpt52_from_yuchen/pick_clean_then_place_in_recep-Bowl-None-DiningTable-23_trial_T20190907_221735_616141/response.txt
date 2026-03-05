(define (problem put_task_pan_water_island)
  (:domain put_task)

  (:objects
    robot - agent

    kitchen_island - receptacle
    sink1 - sink
    fridge1 - fridge

    pan1 - receptacle
    knife1 - knife
    spoon1 fork1 bottle_green1 bottle_green2 bottle_clear1 bowl1 bowl2 tomato1 apple1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; initial placements (objects on/in receptacles)
    (inReceptacle pan1 kitchen_island)
    (inReceptacle knife1 kitchen_island)
    (inReceptacle spoon1 kitchen_island)
    (inReceptacle fork1 kitchen_island)
    (inReceptacle bottle_green1 kitchen_island)
    (inReceptacle bottle_green2 kitchen_island)
    (inReceptacle bottle_clear1 kitchen_island)
    (inReceptacle bowl1 kitchen_island)
    (inReceptacle bowl2 kitchen_island)
    (inReceptacle tomato1 kitchen_island)
    (inReceptacle apple1 kitchen_island)

    ;; agent holds nothing and is not initially at any location (per instructions)
  )

  (:goal
    (and
      ;; "fill the pan with water" modeled in this domain as cleaning it in the sink
      (isClean pan1)

      ;; "put the pan on the kitchen island"
      (inReceptacle pan1 kitchen_island)
    )
  )
)