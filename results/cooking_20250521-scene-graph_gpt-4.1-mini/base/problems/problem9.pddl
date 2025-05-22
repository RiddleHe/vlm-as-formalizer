(define (problem slice_and_place)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    carrot cucumber - vegetable
    knife - tool
    cutting_board bowl counter - location
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole carrot)
    (is-sliced cucumber)
    (at carrot counter)
    (at cucumber cutting_board)
    (is-workspace cutting_board)
    (at knife robot2)
    (at bowl counter)
  )
  (:goal (and
    (is-sliced carrot)
    (not (is-whole carrot))
    (at carrot bowl)
    (at cucumber bowl)
  ))
)