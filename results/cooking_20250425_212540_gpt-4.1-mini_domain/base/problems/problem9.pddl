(define (problem slice-veg)
  (:domain cooking)
  (:objects
    robot1 - robot
    carrot cucumber bowl knife chopping_board - object
    carrot_veg cucumber_veg - vegetable
    tool1 - tool
    table kitchen_counter - location
  )
  (:init
    (at carrot table)
    (at cucumber chopping_board)
    (at knife kitchen_counter)
    (at bowl table)
    (at chopping_board kitchen_counter)
    (at cucumber_veg chopping_board)
    (at carrot_veg table)
  )
  (:goal
    (and
      (sliced carrot_veg)
      (placed_in carrot_veg bowl)
      (placed_in cucumber_veg bowl)
    )
  )
)