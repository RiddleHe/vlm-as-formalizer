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
    (not (is-sliced carrot))
    (is-sliced cucumber)
    (not (is-whole cucumber))
    (at carrot counter)
    (available carrot)
    (at cucumber cutting_board)
    (available cucumber)
    (is-workspace cutting_board)
    (at bowl counter)
  )
  (:goal (and
    (is-sliced carrot)
    (not (is-whole carrot))
    (at carrot bowl)
    (at cucumber bowl)
  ))
)