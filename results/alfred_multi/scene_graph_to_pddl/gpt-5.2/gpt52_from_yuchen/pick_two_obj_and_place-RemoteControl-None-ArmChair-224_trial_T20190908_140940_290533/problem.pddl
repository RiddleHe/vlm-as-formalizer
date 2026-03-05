(define (problem move_two_remotes_to_chair_seat)
  (:domain put_task)

  (:objects
    robot_agent - agent

    black_leather_sofa - receptacle
    open_cardboard_box_on_sofa - receptacle
    brown_tufted_chair_seat - receptacle

    teal_remote_control_on_sofa - object
    green_remote_control_on_sofa - object
    black_smartphone_on_sofa - object
    folded_newspaper_on_sofa - object
    green_pillow_on_sofa - object
    gold_trash_bin - object
    gold_human_trophy_on_dresser - object
    dark_dresser_left - object
    dark_dresser_right - object
    fireplace - object
  )

  (:init
    ;; robot starts not at any location and holds nothing

    ;; containment / placement
    (inReceptacle teal_remote_control_on_sofa black_leather_sofa)
    (inReceptacle green_remote_control_on_sofa black_leather_sofa)
    (inReceptacle black_smartphone_on_sofa black_leather_sofa)
    (inReceptacle folded_newspaper_on_sofa black_leather_sofa)
    (inReceptacle green_pillow_on_sofa black_leather_sofa)
    (inReceptacle open_cardboard_box_on_sofa black_leather_sofa)
  )

  (:goal
    (and
      (inReceptacle teal_remote_control_on_sofa brown_tufted_chair_seat)
      (inReceptacle green_remote_control_on_sofa brown_tufted_chair_seat)
    )
  )
)