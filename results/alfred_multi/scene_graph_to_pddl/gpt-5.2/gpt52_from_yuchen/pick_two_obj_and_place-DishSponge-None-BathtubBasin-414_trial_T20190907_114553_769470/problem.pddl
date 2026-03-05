(define (problem put_two_sponges_in_tub)
  (:domain put_task)
  (:objects
    robot_agent - agent

    freestanding_bathtub_left - receptacle
    bathroom_sink_basin_left - sink
    black_trash_bin_corner_right - receptacle

    green_sponge_on_counter - object
    green_sponge_in_trash_bin - object
    purple_soap_dispenser_on_counter - object
    white_paper_towel_roll_on_counter - object
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; receptacle relations from scene graph
    (inReceptacle green_sponge_on_counter bathroom_sink_basin_left)
    (inReceptacle green_sponge_in_trash_bin black_trash_bin_corner_right)
  )

  (:goal
    (and
      (inReceptacle green_sponge_on_counter freestanding_bathtub_left)
      (inReceptacle green_sponge_in_trash_bin freestanding_bathtub_left)
    )
  )
)