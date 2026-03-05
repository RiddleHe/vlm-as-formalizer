(define (problem put_two_disks_to_bottom_right_shelf)
  (:domain put_task)
  (:objects
    robot - agent

    bottom_right_open_shelf_cubby_of_desk - receptacle

    iridescent_cd_disk_near_left_of_laptop_on_desk - object
    iridescent_cd_disk_on_far_right_desk_surface - object
    silver_laptop_on_right_desk_surface - object
    blue_textbook_on_left_desk_surface - object
    black_office_chair_with_wheels - object
    desk_lamp_base_left_side - object
  )

  (:init
    ;; Robot starts with no location and holds nothing (no atLocation or holds/holdsAny facts).

    ;; Scene graph stated containment
    (inReceptacle silver_laptop_on_right_desk_surface bottom_right_open_shelf_cubby_of_desk)
  )

  (:goal
    (and
      (inReceptacle iridescent_cd_disk_near_left_of_laptop_on_desk bottom_right_open_shelf_cubby_of_desk)
      (inReceptacle iridescent_cd_disk_on_far_right_desk_surface bottom_right_open_shelf_cubby_of_desk)
    )
  )
)