(define (problem put_task_bathroom_towels_in_bathtub)
  (:domain put_task)
  (:objects
    robot - agent

    rectangular_white_sink_basin_on_black_counter - sink
    freestanding_white_bathtub_right_side - receptacle

    white_towel_hanging_on_right_wall_ring - object
    white_towel_hanging_on_left_wall_ring - object
    chrome_towel_ring_right_wall - object
    chrome_towel_ring_left_wall - object
    blue_soap_dispenser_on_counter - object
    black_sink_faucet - object
    white_bathroom_door - object
    large_mirror_above_sink - object
  )

  (:init
    ;; Robot starts not at any location and holds nothing
    ;; (no atLocation facts)
    ;; (no holds / holdsAny facts)

    ;; No receptacles are openable/opened in this scene
    ;; No inReceptacle relations initially given

    ;; Place robot at sink and its contained objects when it goes there (domain effect),
    ;; but initially it is nowhere.
  )

  (:goal
    (and
      (inReceptacle white_towel_hanging_on_right_wall_ring freestanding_white_bathtub_right_side)
      (inReceptacle white_towel_hanging_on_left_wall_ring freestanding_white_bathtub_right_side)
    )
  )
)