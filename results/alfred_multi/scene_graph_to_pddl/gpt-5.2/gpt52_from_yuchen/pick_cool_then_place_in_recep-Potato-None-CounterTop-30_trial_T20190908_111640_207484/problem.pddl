(define (problem put_task_chill_potato_on_island)
  (:domain put_task)

  (:objects
    robot - agent

    microwave_black_countertop - microwave
    fridge_black_double_door - fridge
    island_countertop_brown - receptacle

    knife_yellow_handle_on_island - knife

    loaf_bread_brown_on_island - object
    bottle_clear_with_brown_cap_on_island - object
    small_round_brown_item_on_island - object  ; used as the potato
    cabbage_green_on_island - object
    cup_brown_on_island - object
  )

  (:init
    (openable microwave_black_countertop)
    (openable fridge_black_double_door)

    (inReceptacle loaf_bread_brown_on_island island_countertop_brown)
    (inReceptacle bottle_clear_with_brown_cap_on_island island_countertop_brown)
    (inReceptacle knife_yellow_handle_on_island island_countertop_brown)
    (inReceptacle small_round_brown_item_on_island island_countertop_brown)
    (inReceptacle cabbage_green_on_island island_countertop_brown)
    (inReceptacle cup_brown_on_island island_countertop_brown)
  )

  (:goal
    (and
      (isCool small_round_brown_item_on_island)
      (inReceptacle small_round_brown_item_on_island island_countertop_brown)
    )
  )
)