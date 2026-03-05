(define (problem put_task_warm_slice_bread_on_counter)
  (:domain put_task)
  (:objects
    robot_agent - agent

    red_trim_microwave_above_sinks - microwave
    white_fridge_right_of_counter - fridge
    left_metal_sink_basin - sink
    right_metal_sink_basin - sink

    yellow_handle_serrated_knife_on_counter - knife

    round_black_bowl_on_right_counter - receptacle
    tall_clear_wine_glass_on_right_counter - receptacle
    gold_trash_can_left_of_right_counter - receptacle

    salt_shaker_on_right_counter - object
    thin_metal_spreader_left_of_knife - object
    black_toaster_left_of_sinks - object
    round_gold_bun_on_right_counter - object
  )

  (:init
    ;; openable receptacles
    (openable red_trim_microwave_above_sinks)
    (openable white_fridge_right_of_counter)

    ;; objects currently in receptacles
    (inReceptacle salt_shaker_on_right_counter round_black_bowl_on_right_counter)
    (inReceptacle round_gold_bun_on_right_counter round_black_bowl_on_right_counter)
    (inReceptacle tall_clear_wine_glass_on_right_counter round_black_bowl_on_right_counter)
  )

  (:goal
    (and
      (isHot round_gold_bun_on_right_counter)
      (isSliced round_gold_bun_on_right_counter)
      (atLocation robot_agent left_metal_sink_basin)
      (inReceptacle round_gold_bun_on_right_counter left_metal_sink_basin)
    )
  )
)