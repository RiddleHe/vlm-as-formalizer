(define (problem put_glass_and_knife_on_shelf)
  (:domain put_task)
  (:objects
    robot - agent
    kitchen_shelf - receptacle
    knife1 - knife
    glass1 - object
    bread1 - object
    pump_bottle1 - object
    egg1 - object
    hanging_tool1 - object
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts for robot)

    ;; Receptacle in the scene
    (inReceptacle knife1 kitchen_shelf)
    (inReceptacle bread1 kitchen_shelf)
    (inReceptacle pump_bottle1 kitchen_shelf)
    (inReceptacle egg1 kitchen_shelf)

    ;; Glass is required by the instruction but not visible; represent it as present
    ;; and not currently placed in the shelf.
    ;; (no inReceptacle glass1 kitchen_shelf)

    ;; Hanging tool is present below the shelf (not in shelf)
    ;; (no inReceptacle hanging_tool1 kitchen_shelf)
  )

  (:goal
    (and
      (inReceptacle glass1 kitchen_shelf)
      (inReceptacle knife1 kitchen_shelf)
    )
  )
)