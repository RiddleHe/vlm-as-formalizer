(define (problem put_racket_on_dresser)
  (:domain put_task)
  (:objects
    robot_agent - agent

    microwave - microwave
    fridge - fridge
    sink - sink

    wooden_brown_dresser_with_drawers - receptacle

    knife - knife

    gray_laptop_on_dresser - object
    white_table_lamp_on_dresser - object
    bed_with_blue_blanket - object
    green_pillow_near_bed_edge_left - object
    green_pillow_near_bed_edge_right - object
    orange_tennis_racket_on_floor - object
  )

  (:init
    ;; Robot starts not at any object's location and holds nothing.
    ;; (No atLocation facts)
    ;; (No holds / holdsAny facts)

    ;; Objects currently on/in the dresser surface (modeled as inReceptacle).
    (inReceptacle gray_laptop_on_dresser wooden_brown_dresser_with_drawers)
    (inReceptacle white_table_lamp_on_dresser wooden_brown_dresser_with_drawers)
  )

  (:goal
    (and
      (inReceptacle orange_tennis_racket_on_floor wooden_brown_dresser_with_drawers)
    )
  )
)