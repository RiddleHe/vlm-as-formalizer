(define (problem put_hot_glass_in_cabinet)
  (:domain put_task)
  (:objects
    robot_agent - agent

    black_countertop_microwave_left - microwave
    stainless_inset_sink_center - sink

    white_lower_cabinet_under_sink - receptacle
    white_lower_cabinet_right_of_sink - receptacle
    open_white_drawer_left_of_microwave - receptacle

    clear_glass_tumbler_in_sink_left - object
    clear_glass_bottle_in_sink_left - object
    clear_glass_tumbler_in_sink_center - object
    small_clear_cup_in_sink_center - object
    brown_scrub_sponge_in_sink_right - object
  )

  (:init
    ;; receptacle properties
    (openable black_countertop_microwave_left)
    (openable white_lower_cabinet_under_sink)
    (openable white_lower_cabinet_right_of_sink)
    (openable open_white_drawer_left_of_microwave)

    ;; currently opened
    (opened open_white_drawer_left_of_microwave)

    ;; object placements
    (inReceptacle clear_glass_tumbler_in_sink_left stainless_inset_sink_center)
    (inReceptacle clear_glass_bottle_in_sink_left stainless_inset_sink_center)
    (inReceptacle clear_glass_tumbler_in_sink_center stainless_inset_sink_center)
    (inReceptacle small_clear_cup_in_sink_center stainless_inset_sink_center)
    (inReceptacle brown_scrub_sponge_in_sink_right stainless_inset_sink_center)

    ;; robot starts not holding anything (no holds/holdsAny facts)
  )

  (:goal
    (and
      (isHot clear_glass_tumbler_in_sink_left)
      (inReceptacle clear_glass_tumbler_in_sink_left white_lower_cabinet_under_sink)
    )
  )
)