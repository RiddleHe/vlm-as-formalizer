(define (problem put_task_kitchen_pan_knife_potato_fridge)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    microwave1 - microwave
    sink1 - sink

    pan1 - receptacle
    knife1 - knife
    potato1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; initial containment / placements inferred from the scene
    ;; pan and knife are on the kitchen island/counter (not inside another receptacle)
    ;; potato is not yet cooked or sliced and not inside fridge
    ;; microwave is present and off
    (atLocation robot microwave1)
    (not (opened fridge1))
    (not (isOn microwave1))
  )

  (:goal
    (and
      (inReceptacle pan1 fridge1)
      (inReceptacle knife1 pan1)
      (inReceptacle potato1 pan1)
      (isHot potato1)
      (isSliced potato1)
    )
  )
)