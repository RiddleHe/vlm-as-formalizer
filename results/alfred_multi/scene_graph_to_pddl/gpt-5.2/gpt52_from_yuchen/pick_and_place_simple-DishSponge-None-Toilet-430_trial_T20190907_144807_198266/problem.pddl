(define (problem put_task_bathroom_sponge_toilet_tank)
  (:domain put_task)
  (:objects
    agent0 - agent

    toilet_tank_lid_left_bottom - receptacle
    bathtub_white_topview - receptacle
    shower_tray_with_glass_door_right - receptacle

    toilet_paper_roll_on_tank_left_bottom - object
    shower_glass_door_handle_right - object
    wooden_stool_partial_top_left - object
    bathtub_grab_bar_right - object
    bathtub_drain_circle_top - object
    bathtub_drain_circle_middle - object
  )

  (:init
    (inReceptacle toilet_paper_roll_on_tank_left_bottom toilet_tank_lid_left_bottom)
  )

  (:goal
    (and
      (inReceptacle green_sponge toilet_tank_lid_left_bottom)
    )
  )
)