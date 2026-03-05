(define (problem put_task_cell_phone_exam)
  (:domain put_task)

  (:objects
    robot_agent - agent

    microwave - microwave
    fridge - fridge
    sink - sink

    gold_cylindrical_trash_can_left_wall - receptacle
    dark_wood_two_drawer_nightstand_right_wall - receptacle
    dark_wood_tall_cabinet_far_right_wall - receptacle

    tall_floor_lamp_with_green_shade - object
    cell_phone_black_rectangular_next_to_tall_lamp_light - object
    knife - knife
  )

  (:init
    ;; robot starts not at any object's location (so no atLocation facts)

    ;; receptacles present; none specified as openable/opened
    ;; no inReceptacle relations specified
    ;; robot holds nothing initially (so no holds/holdsAny facts)
  )

  (:goal
    (and
      ;; "Examine" approximated as being at the same location as the cell phone
      (atLocation robot_agent cell_phone_black_rectangular_next_to_tall_lamp_light)
    )
  )
)