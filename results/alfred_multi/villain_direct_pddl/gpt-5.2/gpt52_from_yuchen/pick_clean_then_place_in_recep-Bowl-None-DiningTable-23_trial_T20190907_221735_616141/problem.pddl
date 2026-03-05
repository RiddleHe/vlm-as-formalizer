(define (problem put_task_scene1)
  (:domain put_task)
  (:objects
    robot - agent

    kitchen_island - receptacle
    sink1 - sink

    pan1 - receptacle
    water1 - object
  )

  (:init
    ;; receptacles
    (inReceptacle pan1 kitchen_island)

    ;; robot initially not at any object's location
    (not (atLocation robot kitchen_island))
    (not (atLocation robot sink1))
    (not (atLocation robot pan1))
    (not (atLocation robot water1))
  )

  (:goal
    (and
      ;; fill the pan with water
      (inReceptacle water1 pan1)
      ;; put the pan on the kitchen island
      (inReceptacle pan1 kitchen_island)
    )
  )
)