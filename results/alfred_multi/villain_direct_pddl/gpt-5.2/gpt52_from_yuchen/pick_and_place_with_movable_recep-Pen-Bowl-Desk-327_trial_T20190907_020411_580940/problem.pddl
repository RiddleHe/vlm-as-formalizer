(define (problem put_pen_in_bowl_on_desk)
  (:domain put_task)
  (:objects
    robot - agent
    desk - receptacle
    metal_bowl - receptacle
    pen - object
  )

  (:init
    ;; receptacles
    (openable desk)

    ;; initial containment / placement (treated as inReceptacle in this domain)
    (inReceptacle pen desk)
    (inReceptacle metal_bowl desk)

    ;; robot initially not at any object's location (so no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle pen metal_bowl)
      (inReceptacle metal_bowl desk)
    )
  )
)