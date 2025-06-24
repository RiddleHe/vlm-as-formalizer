(define (problem slice-vegetables)
  (:domain cooking)

  (:objects
    robot1 robot2 - robot
    carrot cucumber - vegetable
    knife - tool
    bowl cutting_board kitchen_workspace - location
  )

  (:init
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
    (is-whole carrot)
    (is-whole cucumber)
    (available carrot)
    (available cucumber)
    (available knife)
    (at carrot kitchen_workspace)
    (at cucumber kitchen_workspace)
    (at bowl kitchen_workspace)
    (at cutting_board kitchen_workspace)
    (is-workspace kitchen_workspace)
  )

  (:goal (and
    (is-sliced carrot)
    (is-sliced cucumber)
    (at carrot bowl)
    (at cucumber bowl)
  ))
)