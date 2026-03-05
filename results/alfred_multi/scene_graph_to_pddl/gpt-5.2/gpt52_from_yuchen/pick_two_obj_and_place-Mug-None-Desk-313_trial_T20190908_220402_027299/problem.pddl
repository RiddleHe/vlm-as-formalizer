(define (problem put_task_cup_on_desk)
  (:domain put_task)

  (:objects
    robot - agent

    ;; receptacles (surfaces that can hold items)
    black_office_desk_tabletop_receptacle - receptacle
    black_bookshelf_top_surface_receptacle - receptacle
    small_black_side_cabinet_top_receptacle - receptacle

    ;; objects
    silver_metal_mug_cup - object
    white_tissue_box - object
    silver_desk_lamp - object
    small_shiny_cd_disc - object
    dark_book_stack_on_desk - object
    yellow_pencil_on_desk - object
    black_smartphone_on_desk - object
    white_notebook_or_paper_on_small_cabinet - object
    dark_pen_on_small_cabinet - object
    red_black_tape_dispenser - object
    cardboard_box_on_bookshelf - object
    red_alarm_clock - object
    white_potted_plant - object
    black_office_chair - object
    black_bookshelf - object
    small_black_side_cabinet - object
  )

  (:init
    ;; robot initially not at any object's location (so no atLocation facts)

    ;; objects currently in receptacles
    (inReceptacle white_tissue_box black_office_desk_tabletop_receptacle)
    (inReceptacle silver_desk_lamp black_office_desk_tabletop_receptacle)
    (inReceptacle small_shiny_cd_disc black_office_desk_tabletop_receptacle)
    (inReceptacle dark_book_stack_on_desk black_office_desk_tabletop_receptacle)
    (inReceptacle yellow_pencil_on_desk black_office_desk_tabletop_receptacle)
    (inReceptacle black_smartphone_on_desk black_office_desk_tabletop_receptacle)

    (inReceptacle white_notebook_or_paper_on_small_cabinet small_black_side_cabinet_top_receptacle)
    (inReceptacle dark_pen_on_small_cabinet small_black_side_cabinet_top_receptacle)
    (inReceptacle red_black_tape_dispenser small_black_side_cabinet_top_receptacle)

    (inReceptacle silver_metal_mug_cup black_bookshelf_top_surface_receptacle)
    (inReceptacle cardboard_box_on_bookshelf black_bookshelf_top_surface_receptacle)
    (inReceptacle red_alarm_clock black_bookshelf_top_surface_receptacle)
    (inReceptacle white_potted_plant black_bookshelf_top_surface_receptacle)
  )

  (:goal
    (and
      (inReceptacle silver_metal_mug_cup black_office_desk_tabletop_receptacle)
    )
  )
)