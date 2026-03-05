(define (problem put_task_box_by_lamp)
  (:domain put_task)

  (:objects
    agent_robot - agent

    open_cardboard_box_on_floor - receptacle
    wooden_nightstand_left_of_bed - receptacle
    wooden_desk_right_side - receptacle
    small_white_cup_on_nightstand - receptacle

    beige_table_lamp_on_desk - object
    black_rectangular_phone_on_desk - object
    round_wooden_alarm_clock_on_desk - object
    red_and_silver_keychain_on_nightstand - object
    dark_pen_1_on_nightstand - object
    dark_pen_2_on_nightstand - object
    turquoise_ball_like_object_near_box - object
    black_mesh_trash_bin_right_edge - object
  )

  (:init
    ;; robot starts not at any object's location (no atLocation facts)

    ;; receptacle containment (as inferred from the scene)
    (inReceptacle beige_table_lamp_on_desk wooden_desk_right_side)
    (inReceptacle black_rectangular_phone_on_desk wooden_desk_right_side)
    (inReceptacle round_wooden_alarm_clock_on_desk wooden_desk_right_side)

    (inReceptacle red_and_silver_keychain_on_nightstand wooden_nightstand_left_of_bed)
    (inReceptacle dark_pen_1_on_nightstand wooden_nightstand_left_of_bed)
    (inReceptacle dark_pen_2_on_nightstand wooden_nightstand_left_of_bed)

    ;; no openable/opened facts given in scene graph
    ;; no holds/holdsAny facts (robot holds nothing)
    ;; lamp assumed initially off (no isOn fact)
  )

  (:goal
    (and
      ;; "Look at a box by the light of a lamp." approximated as:
      ;; box is located with the lamp's receptacle, and lamp is on.
      (inReceptacle open_cardboard_box_on_floor wooden_desk_right_side)
      (isOn beige_table_lamp_on_desk)
    )
  )
)