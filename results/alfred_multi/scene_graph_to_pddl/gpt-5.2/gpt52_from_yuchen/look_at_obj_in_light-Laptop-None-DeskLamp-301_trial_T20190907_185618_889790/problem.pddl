(define (problem put_task_bedroom_laptop_light)
  (:domain put_task)
  (:objects
    robot - agent
    white_bed_with_headboard_receptacle - receptacle
    white_nightstand_with_drawers_receptacle - receptacle
    gray_laptop_left_on_bed - object
    gray_laptop_right_on_bed - object
    black_smartphone_on_bed_center - object
    thick_magazine_book_on_bed_near_pillow - object
    white_pillow_on_bed - object
    table_lamp_with_green_shade_on_nightstand - object
    silver_alarm_clock_on_nightstand - object
  )

  (:init
    (inReceptacle gray_laptop_left_on_bed white_bed_with_headboard_receptacle)
    (inReceptacle gray_laptop_right_on_bed white_bed_with_headboard_receptacle)
    (inReceptacle black_smartphone_on_bed_center white_bed_with_headboard_receptacle)
    (inReceptacle thick_magazine_book_on_bed_near_pillow white_bed_with_headboard_receptacle)
    (inReceptacle white_pillow_on_bed white_bed_with_headboard_receptacle)
    (inReceptacle table_lamp_with_green_shade_on_nightstand white_nightstand_with_drawers_receptacle)
    (inReceptacle silver_alarm_clock_on_nightstand white_nightstand_with_drawers_receptacle)
  )

  (:goal
    (and
      (holds robot gray_laptop_left_on_bed)
      (isOn table_lamp_with_green_shade_on_nightstand)
      (isToggled table_lamp_with_green_shade_on_nightstand)
    )
  )
)