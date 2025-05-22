(define (problem slice_vegetables)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    knife - tool
    cutting_board bowl counter - location
    cucumber carrot - vegetable
  )
  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole cucumber)
    (not (is-sliced cucumber))
    (at cucumber counter)
    (is-whole carrot)
    (not (is-sliced carrot))
    (at carrot counter)
    (is-workspace cutting_board)
    (is-workspace bowl)
    (at bowl counter)
    (at cutting_board cutting_board)
  )
  (:goal (and
    (is-sliced cucumber)
    (at cucumber bowl)
    (is-sliced carrot)
    (at carrot bowl)
  ))
)