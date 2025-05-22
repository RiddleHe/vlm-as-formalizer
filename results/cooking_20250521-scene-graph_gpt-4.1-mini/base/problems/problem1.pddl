(define (problem slice_cucumber_place_in_bowl)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    knife - tool
    cucumber - vegetable
    cutting_board bowl counter - location
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole cucumber)
    (not (is-sliced cucumber))
    (at cucumber cutting_board)
    (at bowl counter)
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