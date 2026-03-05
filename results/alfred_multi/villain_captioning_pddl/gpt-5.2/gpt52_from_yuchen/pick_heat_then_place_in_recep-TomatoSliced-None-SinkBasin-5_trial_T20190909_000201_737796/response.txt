(define (problem kitchen_put_task_tomato)
  (:domain put_task)
  (:objects
    robot - agent

    kitchen_sink - sink
    microwave1 - microwave
    fridge1 - fridge

    knife1 knife2 - knife

    tomato1 - object
    glass1 spoon1 egg1 yellowitem1 potato1 cabbage1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; objects currently in the sink
    (inReceptacle glass1 kitchen_sink)
    (inReceptacle spoon1 kitchen_sink)
    (inReceptacle egg1 kitchen_sink)
    (inReceptacle yellowitem1 kitchen_sink)
    (inReceptacle potato1 kitchen_sink)
    (inReceptacle cabbage1 kitchen_sink)

    ;; no initial agent location is set (robot starts not at any object's location)
    ;; tomato is present in the scene but not already in any receptacle and has no special state yet
  )

  (:goal
    (and
      (inReceptacle tomato1 kitchen_sink)
      (isSliced tomato1)
      (isHot tomato1)
    )
  )
)