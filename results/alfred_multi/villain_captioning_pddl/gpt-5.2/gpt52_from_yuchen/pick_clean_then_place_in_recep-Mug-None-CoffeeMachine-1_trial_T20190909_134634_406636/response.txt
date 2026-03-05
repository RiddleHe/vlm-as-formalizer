(define (problem wash_mug_put_in_coffeemaker)
  (:domain put_task)

  (:objects
    robot - agent

    kitchen_sink - sink
    coffee_maker - receptacle

    coffee_mug - object

    drinking_glass - object
    bowl - object
    spoon - object
    brown_item - object
    toaster - object
    bottle - object
    fork - object
    plate - object
  )

  (:init
    ;; robot starts not at any object's location and holds nothing

    ;; receptacles
    (inReceptacle coffee_mug coffee_maker)

    ;; objects in/at sink area (as described)
    (inReceptacle drinking_glass kitchen_sink)
    (inReceptacle bowl kitchen_sink)
    (inReceptacle spoon kitchen_sink)
    (inReceptacle brown_item kitchen_sink)

    ;; no receptacles in this scene are specified as openable in the caption
  )

  (:goal
    (and
      (isClean coffee_mug)
      (inReceptacle coffee_mug coffee_maker)
    )
  )
)