(define (problem put_phone_on_bed)
  (:domain put_task)
  (:objects
    robot - agent

    wooden_single_bed_with_headboard - receptacle
    wooden_desk_with_drawers - receptacle
    blue_upholstered_chair - receptacle
    silver_trash_can_with_lid - receptacle

    smartphone_white_on_desk - object
    blue_pen_on_desk - object
    small_blue_card_on_desk - object
    table_lamp_on_desk - object
    gray_pillow_on_bed - object
  )

  (:init
    ;; initial containment relations from the scene graph
    (inReceptacle gray_pillow_on_bed wooden_single_bed_with_headboard)
    (inReceptacle smartphone_white_on_desk wooden_desk_with_drawers)
    (inReceptacle blue_pen_on_desk wooden_desk_with_drawers)
    (inReceptacle small_blue_card_on_desk wooden_desk_with_drawers)
    (inReceptacle table_lamp_on_desk wooden_desk_with_drawers)
  )

  (:goal
    (and
      (inReceptacle smartphone_white_on_desk wooden_single_bed_with_headboard)
    )
  )
)