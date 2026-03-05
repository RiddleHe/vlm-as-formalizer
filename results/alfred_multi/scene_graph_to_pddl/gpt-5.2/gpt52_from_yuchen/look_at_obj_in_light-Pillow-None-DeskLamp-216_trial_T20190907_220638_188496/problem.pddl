(define (problem put_task_scene1)
  (:domain put_task)
  (:objects
    robot_agent - agent

    dark_wood_side_table_with_drawer - receptacle
    tissue_box_container_on_table - receptacle

    pink_base_table_lamp_with_rectangular_shade - object
    round_white_dish_on_table - object
    gray_tissue_bundle_in_box - object
    patterned_rectangular_pillow_on_armchair - object
    brown_armchair - object
  )

  (:init
    (inReceptacle pink_base_table_lamp_with_rectangular_shade dark_wood_side_table_with_drawer)
    (inReceptacle round_white_dish_on_table dark_wood_side_table_with_drawer)
    (inReceptacle tissue_box_container_on_table dark_wood_side_table_with_drawer)
    (inReceptacle gray_tissue_bundle_in_box tissue_box_container_on_table)
    (inReceptacle patterned_rectangular_pillow_on_armchair brown_armchair)
  )

  (:goal
    (and
      (holds robot_agent patterned_rectangular_pillow_on_armchair)
      (isOn pink_base_table_lamp_with_rectangular_shade)
    )
  )
)