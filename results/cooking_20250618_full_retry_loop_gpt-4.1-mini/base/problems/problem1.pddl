(define (problem slice_cucumber_place_in_bowl)
  (:domain cooking)
  (:objects
    robot1 - robot
    robot2 - robot
    knife - tool
    cucumber - vegetable
    bowl - location
    cutting_board - location
    counter - location
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole cucumber)
    (at cucumber counter)
    (at bowl counter)
    (at cutting_board counter)
    (is-workspace cutting_board)
    (available cucumber)
  )
  (:goal
    (and
      (is-sliced cucumber)
      (at cucumber bowl)
    )
  )
)