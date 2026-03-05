(define (problem put_two_cushions_on_ottoman)
  (:domain put_task)

  (:objects
    robot - agent

    dark_rectangular_ottoman_coffee_table - receptacle
    dark_two_seat_sofa - receptacle
    dark_single_armchair - receptacle

    orange_plaid_cylindrical_cushion_on_armchair - object
    orange_plaid_cylindrical_cushion_on_sofa - object
    gold_remote_on_ottoman - object
    small_gray_remote_on_ottoman - object
    gold_remote_on_sofa - object
    green_throw_blanket_on_sofa - object
  )

  (:init
    (inReceptacle orange_plaid_cylindrical_cushion_on_armchair dark_single_armchair)
    (inReceptacle orange_plaid_cylindrical_cushion_on_sofa dark_two_seat_sofa)
    (inReceptacle gold_remote_on_ottoman dark_rectangular_ottoman_coffee_table)
    (inReceptacle small_gray_remote_on_ottoman dark_rectangular_ottoman_coffee_table)
    (inReceptacle gold_remote_on_sofa dark_two_seat_sofa)
    (inReceptacle green_throw_blanket_on_sofa dark_two_seat_sofa)
  )

  (:goal
    (and
      (inReceptacle orange_plaid_cylindrical_cushion_on_armchair dark_rectangular_ottoman_coffee_table)
      (inReceptacle orange_plaid_cylindrical_cushion_on_sofa dark_rectangular_ottoman_coffee_table)
    )
  )
)