(define (problem inspect_book_with_light)
  (:domain put_task)
  (:objects
    robot - agent

    wooden_bed_with_white_sheet - receptacle
    wooden_nightstand_top_surface - receptacle

    closed_gray_laptop_on_bed - object
    teal_blue_book_on_bed - object
    white_tufted_pillow_left_on_bed - object
    white_tufted_pillow_right_on_bed - object
    table_lamp_with_green_shade_on_nightstand - object
    yellow_pencil_left_on_nightstand - object
    yellow_pencil_right_on_nightstand - object
    metal_scissors_on_nightstand - object
    small_orange_item_on_nightstand - object
  )

  (:init
    ;; Receptacle containment (from scene graph)
    (inReceptacle closed_gray_laptop_on_bed wooden_bed_with_white_sheet)
    (inReceptacle teal_blue_book_on_bed wooden_bed_with_white_sheet)
    (inReceptacle white_tufted_pillow_left_on_bed wooden_bed_with_white_sheet)
    (inReceptacle white_tufted_pillow_right_on_bed wooden_bed_with_white_sheet)

    (inReceptacle table_lamp_with_green_shade_on_nightstand wooden_nightstand_top_surface)
    (inReceptacle yellow_pencil_left_on_nightstand wooden_nightstand_top_surface)
    (inReceptacle yellow_pencil_right_on_nightstand wooden_nightstand_top_surface)
    (inReceptacle metal_scissors_on_nightstand wooden_nightstand_top_surface)
    (inReceptacle small_orange_item_on_nightstand wooden_nightstand_top_surface)

    ;; Lamp initially off (not stated as on in scene graph); leave as implicit.
  )

  (:goal
    (and
      ;; "Inspect a book from the bed with a light" -> be at the book and have the lamp turned on/toggled
      (atLocation robot teal_blue_book_on_bed)
      (isOn table_lamp_with_green_shade_on_nightstand)
      (isToggled table_lamp_with_green_shade_on_nightstand)
    )
  )
)