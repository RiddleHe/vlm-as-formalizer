(define (problem put_task_scene1)
  (:domain put_task)
  (:objects
    robot_agent - agent

    round_white_side_table_with_lamp - receptacle
    brown_sofa - receptacle

    green_corner_table_lamp - object
    newspaper_on_sofa_left - object
    black_laptop_on_sofa_center - object
    calculator_remote_on_sofa_center_right - object
    keyring_with_keys_on_sofa_right - object
    black_back_cushion_on_sofa - object
    patterned_cylindrical_pillow_on_sofa_left - object
  )

  (:init
    (inReceptacle green_corner_table_lamp round_white_side_table_with_lamp)
    (inReceptacle newspaper_on_sofa_left brown_sofa)
    (inReceptacle black_laptop_on_sofa_center brown_sofa)
    (inReceptacle calculator_remote_on_sofa_center_right brown_sofa)
    (inReceptacle keyring_with_keys_on_sofa_right brown_sofa)
    (inReceptacle black_back_cushion_on_sofa brown_sofa)
    (inReceptacle patterned_cylindrical_pillow_on_sofa_left brown_sofa)
  )

  (:goal
    (and
      (holds robot_agent newspaper_on_sofa_left)
      (isOn green_corner_table_lamp)
    )
  )
)