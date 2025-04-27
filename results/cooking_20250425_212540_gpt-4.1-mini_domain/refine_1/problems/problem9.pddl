(define (problem slice-veg)
  (:domain cooking)
  (:objects
    robot1 - robot
    carrot cucumber bowl knife chopping_board - object
    carrot cucumber - vegetable
    knife - tool
    bowl chopping_board table kitchen_counter - location
  )
  (:init
    (at carrot table)
    (at cucumber chopping_board)
    (at knife kitchen_counter)
    (at bowl table)
  )
  (:goal
    (and
      (sliced carrot)
      (placed_in carrot bowl)
      (placed_in cucumber bowl)
    )
  )
)