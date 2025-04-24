(define (problem slice_carrot_tomato)
  (:domain cooking)
  (:objects
    left_robot right_robot - robot
    carrot tomato - vegetable
    bowl cutting_board counter - location
    knife - tool
  )
  (:init
    (available carrot)
    (available tomato)
    (available knife)
    (is-whole carrot)
    (is-whole tomato)
    (can-cut knife)
    (free left_robot)
    (free right_robot)
    (is-workspace cutting_board)
    (at carrot counter)
    (at tomato counter)
    (at bowl counter)
    (at knife counter)
    (at cutting_board counter)
  )
  (:goal
    (and
      (is-sliced carrot)
      (is-sliced tomato)
      (at carrot bowl)
      (at tomato bowl)
    )
  )
)