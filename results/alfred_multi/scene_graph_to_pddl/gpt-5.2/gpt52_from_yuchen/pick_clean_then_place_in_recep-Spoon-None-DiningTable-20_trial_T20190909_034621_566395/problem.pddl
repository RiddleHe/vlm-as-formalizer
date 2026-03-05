(define (problem put_task_clean_spoon_on_table)
  (:domain put_task)
  (:objects
    robot - agent

    sink_stainless_countertop - sink
    table_white_center - receptacle

    spoon_metal_on_table - object
  )

  (:init
    ;; Robot starts not at any location (no atLocation facts)

    ;; Receptacle relations from scene graph
    ;; (none involving the spoon; spoon is currently on the table but not modeled as inReceptacle)

    ;; No objects are initially clean per scene graph
  )

  (:goal
    (and
      (isClean spoon_metal_on_table)
      (inReceptacle spoon_metal_on_table table_white_center)
    )
  )
)