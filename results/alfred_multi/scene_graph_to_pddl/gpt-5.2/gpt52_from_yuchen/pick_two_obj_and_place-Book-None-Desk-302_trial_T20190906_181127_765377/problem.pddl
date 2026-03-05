(define (problem put_books_on_desk)
  (:domain put_task)
  (:objects
    robot - agent

    wooden_desk_with_drawer_right - receptacle
    bed_with_orange_geometric_bedspread - receptacle

    book_blue_cover_left_on_bed - object
    book_purple_cover_lower_left_on_bed - object
    open_black_laptop_on_bed - object
    stuffed_panda_on_bed - object
    purple_pillow_right_on_bed - object
    smartphone_left_on_desk - object
    smartphone_right_on_desk - object
    clear_plastic_cup_stack_on_desk - object
    chair_left_of_desk - object
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; receptacle contents from scene graph
    (inReceptacle book_blue_cover_left_on_bed bed_with_orange_geometric_bedspread)
    (inReceptacle book_purple_cover_lower_left_on_bed bed_with_orange_geometric_bedspread)
    (inReceptacle open_black_laptop_on_bed bed_with_orange_geometric_bedspread)
    (inReceptacle stuffed_panda_on_bed bed_with_orange_geometric_bedspread)
    (inReceptacle purple_pillow_right_on_bed bed_with_orange_geometric_bedspread)

    (inReceptacle smartphone_left_on_desk wooden_desk_with_drawer_right)
    (inReceptacle smartphone_right_on_desk wooden_desk_with_drawer_right)
    (inReceptacle clear_plastic_cup_stack_on_desk wooden_desk_with_drawer_right)
  )

  (:goal
    (and
      (inReceptacle book_blue_cover_left_on_bed wooden_desk_with_drawer_right)
      (inReceptacle book_purple_cover_lower_left_on_bed wooden_desk_with_drawer_right)
    )
  )
)