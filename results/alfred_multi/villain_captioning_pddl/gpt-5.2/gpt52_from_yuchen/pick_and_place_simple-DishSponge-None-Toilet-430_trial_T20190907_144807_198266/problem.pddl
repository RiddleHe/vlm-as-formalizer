(define (problem bathroom_put_sponge_on_toilet_tank)
  (:domain put_task)
  (:objects
    robot - agent

    bathtub1 showerstall1 toilettank1 - receptacle
    toiletpaper1 greensponge1 - object
  )

  (:init
    ;; Robot initially not at any object's location (no atLocation facts)

    ;; Current known containment/placement from the scene
    (inReceptacle toiletpaper1 toilettank1)
  )

  (:goal
    (and
      (inReceptacle greensponge1 toilettank1)
    )
  )
)