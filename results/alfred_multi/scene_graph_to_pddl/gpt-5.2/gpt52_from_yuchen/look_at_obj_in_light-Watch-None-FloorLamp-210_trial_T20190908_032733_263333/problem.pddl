(define (problem put_task_ring_lamp)
  (:domain put_task)

  (:objects
    robot - agent
    silver_ring_with_brown_band_on_left_side_of_wooden_dresser - object
    tall_table_lamp_with_beige_shade_and_red_trim - object
    flat_screen_tv_on_back_of_wooden_dresser - object
    beige_human_figure_statue_on_black_base_right_side_of_dresser - object
    wooden_dresser_top_surface - object
  )

  (:init
    ;; robot starts not at any object's location (no atLocation facts)

    ;; scene layout: objects are on/at the dresser top surface
    (inReceptacle silver_ring_with_brown_band_on_left_side_of_wooden_dresser wooden_dresser_top_surface)
    (inReceptacle tall_table_lamp_with_beige_shade_and_red_trim wooden_dresser_top_surface)
    (inReceptacle flat_screen_tv_on_back_of_wooden_dresser wooden_dresser_top_surface)
    (inReceptacle beige_human_figure_statue_on_black_base_right_side_of_dresser wooden_dresser_top_surface)
  )

  (:goal
    (and
      (holds robot silver_ring_with_brown_band_on_left_side_of_wooden_dresser)
      (isOn tall_table_lamp_with_beige_shade_and_red_trim)
    )
  )
)