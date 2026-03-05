(define (problem put_box_on_green_chair)
  (:domain put_task)

  (:objects
    robot - agent
    green_chair - receptacle
    cardboard_box - receptacle
    side_table - object
  )

  (:init
    ;; Robot starts not at any object's location (per instruction).
    ;; Object locations / relationships
    (inReceptacle cardboard_box side_table)
  )

  (:goal
    (and
      (inReceptacle cardboard_box green_chair)
    )
  )
)