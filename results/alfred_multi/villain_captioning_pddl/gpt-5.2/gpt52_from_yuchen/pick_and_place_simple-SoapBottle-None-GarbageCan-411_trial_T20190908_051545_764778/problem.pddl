(define (problem bathroom_put_pump_in_garbage)
  (:domain put_task)

  (:objects
    robot - agent

    garbage_can - receptacle

    pump_bottle - object
    spray_bottle1 - object
    spray_bottle2 - object
    toilet_paper_roll - object
    plunger - object
    toilet_brush - object
    pink_block_counter - object
    pink_block_in_can - object
    small_cylinder_yellow - object
    cylinder_brown - object
  )

  (:init
    ;; receptacle properties
    ;; garbage can is an open-top can (not modeled as openable in this domain)

    ;; robot starts not at any object location and holding nothing
    (not (holdsAny robot))

    ;; object locations (co-located on toilet tank area)
    (atLocation robot pump_bottle)
    (atLocation robot spray_bottle1)
    (atLocation robot spray_bottle2)
    (atLocation robot toilet_paper_roll)

    ;; object locations (co-located under-counter garbage can area)
    (atLocation robot garbage_can)
    (atLocation robot pink_block_in_can)

    ;; other visible objects (locations not critical to the task, but included)
    (atLocation robot plunger)
    (atLocation robot toilet_brush)
    (atLocation robot pink_block_counter)
    (atLocation robot small_cylinder_yellow)
    (atLocation robot cylinder_brown)

    ;; containment relations
    (inReceptacle pink_block_in_can garbage_can)
  )

  (:goal
    (and
      (inReceptacle pump_bottle garbage_can)
    )
  )
)