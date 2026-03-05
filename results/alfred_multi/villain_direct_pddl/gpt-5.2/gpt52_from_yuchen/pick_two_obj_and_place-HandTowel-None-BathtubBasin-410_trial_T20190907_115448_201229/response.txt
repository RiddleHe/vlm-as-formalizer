(define (problem put_task_bathroom_towels_in_bathtub)
  (:domain put_task)
  (:objects
    robot - agent
    bathtub - receptacle
    towel1 towel2 - object
  )

  (:init
    ;; receptacle facts
    ;; bathtub is a receptacle; no evidence it is openable in the scene

    ;; initial locations (robot initially not at any object's location)
    (atLocation robot towel1)
    (atLocation robot towel2)

    ;; towels initially not in the bathtub
    (not (inReceptacle towel1 bathtub))
    (not (inReceptacle towel2 bathtub))
  )

  (:goal
    (and
      (inReceptacle towel1 bathtub)
      (inReceptacle towel2 bathtub)
    )
  )
)