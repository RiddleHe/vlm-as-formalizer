(define (problem put_task_pen_bowl_desk)
  (:domain put_task)

  (:objects
    robot - agent

    desk - receptacle
    metal_bowl1 metal_bowl2 - receptacle

    pen - object
  )

  (:init
    ;; receptacles can hold objects
    ;; (no openable/opened relations visible/required in this scene)

    ;; initial containment / placements from the scene
    (inReceptacle pen desk)

    ;; bowls are on top of a cabinet/surface; represented as receptacles (locations)
    ;; robot is initially not at any object's location (so no atLocation facts for robot)
  )

  (:goal
    (and
      ;; pen is in a metal bowl
      (or (inReceptacle pen metal_bowl1)
          (inReceptacle pen metal_bowl2))

      ;; and the (bowl containing the pen) is placed onto the desk
      (or (and (inReceptacle pen metal_bowl1) (inReceptacle metal_bowl1 desk))
          (and (inReceptacle pen metal_bowl2) (inReceptacle metal_bowl2 desk)))
    )
  )
)