(define (problem move_keys_desk_to_floral_armchair)
  (:domain put_task)

  (:objects
    robot - agent
    desk - receptacle
    floral_armchair - receptacle
    keys - object
    purple_cushion - object
    dark_rect_item - object
    desk_lamp - object
    desk_chair - object
  )

  (:init
    ;; Agent starts not at any object's location (no atLocation facts for robot)

    ;; Current object placements (modeled as being in the receptacle/surface)
    (inReceptacle keys desk)
    (inReceptacle purple_cushion floral_armchair)
    (inReceptacle dark_rect_item floral_armchair)
    (inReceptacle desk_lamp desk)
    (inReceptacle desk_chair desk)
  )

  (:goal
    (and
      (inReceptacle keys floral_armchair)
    )
  )
)