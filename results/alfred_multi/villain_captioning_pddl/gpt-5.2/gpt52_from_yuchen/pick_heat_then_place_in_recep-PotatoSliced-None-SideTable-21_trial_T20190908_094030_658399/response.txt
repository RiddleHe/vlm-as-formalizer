(define (problem put_task_kitchen_scene_01)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge
    sink1 - sink

    blacktable1 - receptacle

    knife1 - knife

    potato1 - object
    saltshaker1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; robot initially not at any object's location (no atLocation facts)

    ;; object locations / containment
    (inReceptacle saltshaker1 blacktable1)

    ;; other relevant objects are present in the scene (not necessarily in receptacles)
    ;; potato is on the white table in the scene (modeled as its own location object)
    (atLocation robot microwave1) ; not included per instruction; robot starts at no location
  )

  (:goal
    (and
      (isSliced potato1)
      (isHot potato1)
      (inReceptacle potato1 blacktable1)
      (inReceptacle saltshaker1 blacktable1)
    )
  )
)