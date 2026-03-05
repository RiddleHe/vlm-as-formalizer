(define (problem put_task_chilled_potato_on_island)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    microwave1 - microwave
    island1 - receptacle

    potato1 - object
    knife1 - knife
    breadloaf1 - object
    greenv1 - object
    cup1 - object
    bottle1 - object
  )

  (:init
    ;; receptacles that are openable
    (openable fridge1)
    (openable microwave1)

    ;; objects initially on the island surface (modeled as inReceptacle)
    (inReceptacle potato1 island1)
    (inReceptacle knife1 island1)
    (inReceptacle breadloaf1 island1)
    (inReceptacle greenv1 island1)
    (inReceptacle cup1 island1)
    (inReceptacle bottle1 island1)

    ;; robot starts holding nothing and is not at any object's location
    ;; (no (holdsAny robot), no (atLocation robot ...))
  )

  (:goal
    (and
      (isCool potato1)
      (inReceptacle potato1 island1)
    )
  )
)