(define (problem desk_lamp_and_tissues)
  (:domain put_task)
  (:objects
    robot - agent

    wooden_desk_surface_receptacle - receptacle
    green_tissue_box_left_receptacle - receptacle
    green_tissue_box_center_receptacle - receptacle

    pink_table_lamp_object - object
    orange_pencil_object - object
    blue_pen_object - object
    small_keys_bundle_object - object
    round_digital_alarm_clock_object - object
    black_chair_object - object
    gray_dumbbell_object - object
  )

  (:init
    ;; receptacle containment on the desk
    (inReceptacle pink_table_lamp_object wooden_desk_surface_receptacle)
    (inReceptacle green_tissue_box_left_receptacle wooden_desk_surface_receptacle)
    (inReceptacle green_tissue_box_center_receptacle wooden_desk_surface_receptacle)
    (inReceptacle orange_pencil_object wooden_desk_surface_receptacle)
    (inReceptacle blue_pen_object wooden_desk_surface_receptacle)
    (inReceptacle small_keys_bundle_object wooden_desk_surface_receptacle)
    (inReceptacle round_digital_alarm_clock_object wooden_desk_surface_receptacle)

    ;; no openable/opened receptacles in this scene
    ;; robot starts with no location and holds nothing (so no holds/holdsAny facts)
  )

  (:goal
    (and
      (isOn pink_table_lamp_object)
      (holds robot green_tissue_box_center_receptacle)
    )
  )
)