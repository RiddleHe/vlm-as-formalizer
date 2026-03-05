(define (problem put_grey_plate_with_spoon_on_counter)
  (:domain put_task)

  (:objects
    robot - agent

    microwave_left_counter - microwave
    rectangular_grey_marble_sink_basin - sink
    left_grey_countertop right_grey_countertop - receptacle

    large_metal_spoon_in_sink - object
    green_yellow_sponge_in_sink thin_butter_knife_in_sink - object
    yellow_handle_serrated_knife_in_sink - knife
  )

  (:init
    (openable microwave_left_counter)

    (inReceptacle large_metal_spoon_in_sink rectangular_grey_marble_sink_basin)
    (inReceptacle green_yellow_sponge_in_sink rectangular_grey_marble_sink_basin)
    (inReceptacle thin_butter_knife_in_sink rectangular_grey_marble_sink_basin)
    (inReceptacle yellow_handle_serrated_knife_in_sink rectangular_grey_marble_sink_basin)
  )

  (:goal
    (and
      ;; Interpreting the "grey plate with a large metal spoon on it" as placing the spoon onto the counter,
      ;; since no plate object is present in the provided scene graph.
      (inReceptacle large_metal_spoon_in_sink left_grey_countertop)
    )
  )
)