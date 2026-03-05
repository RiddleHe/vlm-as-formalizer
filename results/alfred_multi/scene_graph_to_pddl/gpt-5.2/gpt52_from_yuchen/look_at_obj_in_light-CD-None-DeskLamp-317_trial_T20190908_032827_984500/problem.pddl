(define (problem inspect-cd-by-lamp-light)
  (:domain put_task)
  (:objects
    robot_agent - agent

    microwave - microwave
    fridge - fridge
    sink - sink

    wooden_dresser_top_surface - receptacle
    wooden_nightstand_top_surface - receptacle
    clear_glass_bowl_receptacle - receptacle

    red_credit_card_like_card - object
    white_smartphone_left - object
    white_smartphone_right - object
    silver_toaster_like_device - object
    cd_disc_shiny - object
    small_keys_with_keyring - object
    green_shaded_table_lamp - object
  )

  (:init
    ;; receptacle relations from scene graph
    (inReceptacle red_credit_card_like_card wooden_dresser_top_surface)
    (inReceptacle white_smartphone_left wooden_dresser_top_surface)
    (inReceptacle white_smartphone_right wooden_dresser_top_surface)
    (inReceptacle clear_glass_bowl_receptacle wooden_dresser_top_surface)
    (inReceptacle silver_toaster_like_device wooden_dresser_top_surface)
    (inReceptacle cd_disc_shiny wooden_dresser_top_surface)
    (inReceptacle small_keys_with_keyring wooden_dresser_top_surface)
    (inReceptacle green_shaded_table_lamp wooden_nightstand_top_surface)

    ;; agent location info as provided
    (atLocation robot_agent wooden_dresser_top_surface)
    (atLocation robot_agent wooden_nightstand_top_surface)
  )

  (:goal
    (and
      ;; Use lamp light: toggle lamp on
      (isOn green_shaded_table_lamp)
      (isToggled green_shaded_table_lamp)

      ;; "Inspect" the CD: have the agent at the CD's location (reachable/at location)
      (atLocation robot_agent cd_disc_shiny)
    )
  )
)