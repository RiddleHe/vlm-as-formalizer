(define (problem put_task_place_two_watches_on_tv_stand)
  (:domain put_task)
  (:objects
    robot - agent

    transparent_glass_dining_table_receptacle - receptacle
    dark_wood_tv_stand_receptacle - receptacle
    open_cardboard_box_left_on_table_receptacle - receptacle
    open_cardboard_box_right_on_table_receptacle - receptacle

    watch_remote_left_on_table - object
    watch_remote_center_on_table - object
    watch_remote_right_on_table - object
    red_card_on_table - object
  )

  (:init
    ;; robot starts not co-located with any object (no atLocation facts)

    ;; object containment / support relations from scene graph
    (inReceptacle watch_remote_left_on_table transparent_glass_dining_table_receptacle)
    (inReceptacle watch_remote_center_on_table transparent_glass_dining_table_receptacle)
    (inReceptacle watch_remote_right_on_table transparent_glass_dining_table_receptacle)
    (inReceptacle red_card_on_table transparent_glass_dining_table_receptacle)
    (inReceptacle open_cardboard_box_left_on_table_receptacle transparent_glass_dining_table_receptacle)
    (inReceptacle open_cardboard_box_right_on_table_receptacle transparent_glass_dining_table_receptacle)
  )

  (:goal
    (and
      ;; place two watches (choose left and center) on the TV stand
      (inReceptacle watch_remote_left_on_table dark_wood_tv_stand_receptacle)
      (inReceptacle watch_remote_center_on_table dark_wood_tv_stand_receptacle)
    )
  )
)