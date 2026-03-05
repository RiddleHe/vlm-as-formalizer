(define (problem put_task_chilled_potato_on_island)
  (:domain put_task)
  (:objects
    robot - agent

    fridge1 - fridge
    microwave1 - microwave

    island1 - receptacle

    potato1 - object
    knife1 - knife
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; object locations (robot starts not at any location)
    (inReceptacle potato1 fridge1)
    (inReceptacle knife1 island1)
    (inReceptacle microwave1 island1)
    (inReceptacle fridge1 island1)
  )

  (:goal
    (and
      (isCool potato1)
      (inReceptacle potato1 island1)
    )
  )
)