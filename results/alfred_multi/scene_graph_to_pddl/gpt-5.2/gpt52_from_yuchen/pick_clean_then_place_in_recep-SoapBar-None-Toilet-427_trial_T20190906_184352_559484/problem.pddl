(define (problem put_task_bathroom_soap_to_toilet)
  (:domain put_task)
  (:objects
    robot_agent - agent
    bathroom_wall_sink_left - sink
    bathtub_center - receptacle
    toilet_tank_lid_bottom - receptacle
    pink_bar_soap_in_bathtub - object
    green_bar_soap_in_bathtub - object
    toilet_paper_roll_on_toilet - object
    yellow_toothbrush_on_toilet - object
  )
  (:init
    ;; robot initial location (given by scene graph)
    (atLocation robot_agent bathroom_wall_sink_left)

    ;; object placements
    (inReceptacle pink_bar_soap_in_bathtub bathtub_center)
    (inReceptacle green_bar_soap_in_bathtub bathtub_center)
    (inReceptacle toilet_paper_roll_on_toilet toilet_tank_lid_bottom)
    (inReceptacle yellow_toothbrush_on_toilet toilet_tank_lid_bottom)
  )
  (:goal
    (and
      (isClean green_bar_soap_in_bathtub)
      (inReceptacle green_bar_soap_in_bathtub toilet_tank_lid_bottom)
    )
  )
)