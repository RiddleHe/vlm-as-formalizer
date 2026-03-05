(define (problem put_two_phones_on_dresser)
  (:domain put_task)

  (:objects
    robot_agent - agent

    microwave - microwave
    fridge - fridge
    sink - sink

    wooden_dresser_top_surface - receptacle
    bed_top_surface - receptacle
    small_wooden_table_surface - receptacle

    black_phone_on_bed_left - object
    black_phone_on_small_table_left - object
    white_bowl_on_small_table_right - object
    black_book_on_bed_center - object
    black_book_on_bed_right - object
    black_book_on_bed_top_left - object
    black_book_on_bed_bottom_left - object
    silver_alarm_clock_on_dresser - object
    metal_keys_on_dresser - object
    white_pen_on_dresser - object
    white_lamp_on_dresser - object
    knife - knife
  )

  (:init
    ;; Receptacle relations from scene graph
    (inReceptacle black_phone_on_bed_left bed_top_surface)
    (inReceptacle black_book_on_bed_center bed_top_surface)
    (inReceptacle black_book_on_bed_right bed_top_surface)
    (inReceptacle black_book_on_bed_top_left bed_top_surface)
    (inReceptacle black_book_on_bed_bottom_left bed_top_surface)

    (inReceptacle black_phone_on_small_table_left small_wooden_table_surface)
    (inReceptacle white_bowl_on_small_table_right small_wooden_table_surface)

    (inReceptacle silver_alarm_clock_on_dresser wooden_dresser_top_surface)
    (inReceptacle metal_keys_on_dresser wooden_dresser_top_surface)
    (inReceptacle white_pen_on_dresser wooden_dresser_top_surface)
    (inReceptacle white_lamp_on_dresser wooden_dresser_top_surface)
  )

  (:goal
    (and
      (inReceptacle black_phone_on_bed_left wooden_dresser_top_surface)
      (inReceptacle black_phone_on_small_table_left wooden_dresser_top_surface)
    )
  )
)