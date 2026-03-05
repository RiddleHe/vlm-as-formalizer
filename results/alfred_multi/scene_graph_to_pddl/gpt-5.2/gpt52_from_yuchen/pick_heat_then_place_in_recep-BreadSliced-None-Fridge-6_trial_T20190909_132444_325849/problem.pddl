(define (problem cook_chill_bread_slice_problem)
  (:domain put_task)
  (:objects
    robot_agent - agent

    stainless_microwave_on_right_counter - microwave
    black_fridge_with_smiley_magnet - fridge

    dark_blade_knife_on_counter - knife
    rectangular_bread_loaf_on_counter - object
    green_lettuce_head_left - object
    green_lettuce_head_right - object
    clear_salt_shaker_with_metal_top - object
  )

  (:init
    ;; receptacles that can be opened
    (openable stainless_microwave_on_right_counter)
    (openable black_fridge_with_smiley_magnet)

    ;; objects are at their own locations initially (agent starts at no location)
    (atLocation robot_agent stainless_microwave_on_right_counter)
    (atLocation robot_agent black_fridge_with_smiley_magnet)
    (atLocation robot_agent dark_blade_knife_on_counter)
    (atLocation robot_agent rectangular_bread_loaf_on_counter)
    (atLocation robot_agent green_lettuce_head_left)
    (atLocation robot_agent green_lettuce_head_right)
    (atLocation robot_agent clear_salt_shaker_with_metal_top)
  )

  (:goal
    (and
      (isSliced rectangular_bread_loaf_on_counter)
      (isHot rectangular_bread_loaf_on_counter)
      (isCool rectangular_bread_loaf_on_counter)
    )
  )
)