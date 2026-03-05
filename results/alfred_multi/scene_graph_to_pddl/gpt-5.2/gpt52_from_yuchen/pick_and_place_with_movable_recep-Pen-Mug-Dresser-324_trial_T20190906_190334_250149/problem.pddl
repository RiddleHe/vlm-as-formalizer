(define (problem put_pen_in_black_cup)
  (:domain put_task)
  (:objects
    robot - agent

    wooden_dresser_near_laptop - receptacle
    small_wood_bookshelf_against_wall - receptacle
    black_cup_on_small_bookshelf - receptacle

    open_laptop_on_dresser - object
    yellow_pencil_on_dresser - object
    red_pen_on_dresser - object
    keyring_with_keys_on_dresser - object
    blue_smartphone_on_dresser_left - object
    table_lamp_on_dresser_left - object
    brown_digital_alarm_clock_on_small_bookshelf - object
    keyring_with_keys_on_small_bookshelf - object
    books_in_small_bookshelf_left_cubby - object
    books_in_small_bookshelf_middle_cubby - object
    books_in_small_bookshelf_right_cubby - object
    books_in_small_bookshelf_bottom_shelf - object
  )

  (:init
    ;; Receptacle containment (as observed)
    (inReceptacle open_laptop_on_dresser wooden_dresser_near_laptop)
    (inReceptacle yellow_pencil_on_dresser wooden_dresser_near_laptop)
    (inReceptacle red_pen_on_dresser wooden_dresser_near_laptop)
    (inReceptacle keyring_with_keys_on_dresser wooden_dresser_near_laptop)
    (inReceptacle blue_smartphone_on_dresser_left wooden_dresser_near_laptop)
    (inReceptacle table_lamp_on_dresser_left wooden_dresser_near_laptop)

    (inReceptacle brown_digital_alarm_clock_on_small_bookshelf small_wood_bookshelf_against_wall)
    (inReceptacle keyring_with_keys_on_small_bookshelf small_wood_bookshelf_against_wall)
    (inReceptacle black_cup_on_small_bookshelf small_wood_bookshelf_against_wall)
    (inReceptacle books_in_small_bookshelf_left_cubby small_wood_bookshelf_against_wall)
    (inReceptacle books_in_small_bookshelf_middle_cubby small_wood_bookshelf_against_wall)
    (inReceptacle books_in_small_bookshelf_right_cubby small_wood_bookshelf_against_wall)
    (inReceptacle books_in_small_bookshelf_bottom_shelf small_wood_bookshelf_against_wall)

    ;; Robot initially holds nothing and is not at any location (per instruction)
  )

  (:goal
    (and
      (inReceptacle red_pen_on_dresser black_cup_on_small_bookshelf)
    )
  )
)