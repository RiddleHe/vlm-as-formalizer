(define (problem put_task_kitchen_scene_01)
  (:domain put_task)

  (:objects
    robot - agent

    kitchen_sink - sink
    kitchen_fridge - fridge

    potato1 - object
    tomato1 - object
    fork1 - object
    bread1 - object

    slicing_knife1 - knife
  )

  (:init
    ;; receptacle properties
    (openable kitchen_fridge)

    ;; initial object placements from the scene
    (inReceptacle tomato1 kitchen_sink)
    (inReceptacle fork1 kitchen_sink)

    ;; potato and bread are on the counter (modeled as not in any receptacle)
    ;; (no inReceptacle facts for potato1 or bread1)

    ;; knife required by the instruction; place it in the fridge initially
    (inReceptacle slicing_knife1 kitchen_fridge)

    ;; robot starts not at any object's location (so no atLocation facts for robot)
  )

  (:goal
    (and
      ;; "Put a chilled slice of potato in a sink"
      (isSliced potato1)
      (isCool potato1)
      (inReceptacle potato1 kitchen_sink)

      ;; "leaving the slicing knife in the fridge"
      (inReceptacle slicing_knife1 kitchen_fridge)
    )
  )
)