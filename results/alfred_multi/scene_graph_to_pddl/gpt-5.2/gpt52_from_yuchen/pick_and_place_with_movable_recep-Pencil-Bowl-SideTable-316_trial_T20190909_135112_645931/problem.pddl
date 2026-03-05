(define (problem put_bowl_with_pencil_on_nightstand)
  (:domain put_task)

  (:objects
    robot_agent - agent

    wooden_nightstand_right_of_bed - receptacle
    small_trash_can_left_of_desk - receptacle
    black_two_drawer_filing_cabinet_under_desk - receptacle
    blue_cup_on_desk - receptacle
    brown_bowl_on_right_desk - receptacle
    curved_wood_desk_surface - receptacle

    black_office_chair - object
    black_laptop_on_left_desk - object
    black_monitor_on_corner_desk - object
    black_monitor_left_side - object
    orange_book_on_desk - object
    blue_card_on_desk - object
    white_cd_on_desk - object
    red_black_alarm_clock_on_right_desk - object
    pillow_on_bed - object
    blue_bedspread - object
    brown_blanket_on_bed - object
    yellow_book_on_bed - object
    blue_pencil_center_desk - object
    blue_pencil_near_corner_desk - object
    blue_pencil_left_desk - object
    blue_pen_like_object_on_desk - object
  )

  (:init
    ;; receptacle containment facts from the scene graph
    (inReceptacle orange_book_on_desk curved_wood_desk_surface)
    (inReceptacle blue_card_on_desk curved_wood_desk_surface)
    (inReceptacle white_cd_on_desk curved_wood_desk_surface)
    (inReceptacle black_monitor_on_corner_desk curved_wood_desk_surface)
    (inReceptacle black_monitor_left_side curved_wood_desk_surface)
    (inReceptacle black_laptop_on_left_desk curved_wood_desk_surface)
    (inReceptacle red_black_alarm_clock_on_right_desk curved_wood_desk_surface)
    (inReceptacle blue_cup_on_desk curved_wood_desk_surface)
    (inReceptacle brown_bowl_on_right_desk curved_wood_desk_surface)
    (inReceptacle blue_pencil_center_desk curved_wood_desk_surface)
    (inReceptacle blue_pencil_near_corner_desk curved_wood_desk_surface)
    (inReceptacle blue_pencil_left_desk curved_wood_desk_surface)
    (inReceptacle blue_pen_like_object_on_desk curved_wood_desk_surface)

    ;; no openable/opened facts; no holds/holdsAny; agent starts at no location (no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle blue_pencil_center_desk brown_bowl_on_right_desk)
      (inReceptacle brown_bowl_on_right_desk wooden_nightstand_right_of_bed)
    )
  )
)