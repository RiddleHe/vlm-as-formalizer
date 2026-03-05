(define (problem turn_on_lamp_with_remote)
  (:domain put_task)
  (:objects
    robot - agent

    green_three_cushion_sofa_receptacle - receptacle
    beige_lampshade_table_lamp_receptacle - receptacle

    red_square_throw_pillow - object
    lightwood_rectangular_object_on_sofa - object
    blue_credit_card_like_card_on_sofa - object
    white_tv_remote_control_with_buttons - object
  )

  (:init
    ;; objects in receptacles
    (inReceptacle red_square_throw_pillow green_three_cushion_sofa_receptacle)
    (inReceptacle lightwood_rectangular_object_on_sofa green_three_cushion_sofa_receptacle)
    (inReceptacle blue_credit_card_like_card_on_sofa green_three_cushion_sofa_receptacle)
    (inReceptacle white_tv_remote_control_with_buttons green_three_cushion_sofa_receptacle)

    ;; lamp state
    (isOn beige_lampshade_table_lamp_receptacle)
  )

  (:goal
    (and
      (isToggled white_tv_remote_control_with_buttons)
      (isOn beige_lampshade_table_lamp_receptacle)
    )
  )
)