(define (problem cool_egg_put_in_microwave)
  (:domain put_task)
  (:objects
    robot - agent

    microwave_right_of_counter - microwave
    fridge_stainless_right - fridge

    countertop_work_surface - receptacle
    bowl_white_right - receptacle
    plate_gray_left - receptacle
    trash_bin_green_back - receptacle

    knife_black_handle_counter - knife

    egg_light_tan - object
    apple_red_front_center - object
    apple_red_back_center - object
    bread_loaf_left - object
    bread_loaf_right - object
    ladle_gold_blue_handle - object
    fork_upright_center - object
    soap_dispenser_gray_left - object
    salt_shaker_left - object
    utensil_black_handle_right - object
  )

  (:init
    (openable microwave_right_of_counter)
    (openable fridge_stainless_right)

    (inReceptacle egg_light_tan countertop_work_surface)
    (inReceptacle apple_red_front_center countertop_work_surface)
    (inReceptacle apple_red_back_center countertop_work_surface)
    (inReceptacle bread_loaf_left countertop_work_surface)
    (inReceptacle bread_loaf_right countertop_work_surface)
    (inReceptacle ladle_gold_blue_handle countertop_work_surface)
    (inReceptacle fork_upright_center countertop_work_surface)
    (inReceptacle fork_upright_center countertop_work_surface)
    (inReceptacle knife_black_handle_counter countertop_work_surface)
    (inReceptacle bowl_white_right countertop_work_surface)
    (inReceptacle plate_gray_left countertop_work_surface)
    (inReceptacle trash_bin_green_back countertop_work_surface)
    (inReceptacle soap_dispenser_gray_left countertop_work_surface)
    (inReceptacle salt_shaker_left countertop_work_surface)
    (inReceptacle utensil_black_handle_right countertop_work_surface)
  )

  (:goal
    (and
      (isCool egg_light_tan)
      (inReceptacle egg_light_tan microwave_right_of_counter)
    )
  )
)