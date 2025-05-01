(define (problem cooking_problem_1)
  (:domain cooking)
  (:objects 
    robot1 robot2 - robot
    knife spatula - tool
    cucumber carrot tomato - vegetable
    bowl cutting_board counter - location
  )
  (:init 
    (free robot1)
    (free robot2)
    (available cucumber)
    (available carrot)
    (available tomato)
    (available knife)
    (can-cut knife)
    (at cucumber counter)
    (at carrot counter)
    (at tomato counter)
    (at bowl counter)
    (at knife robot1)
    (is-whole cucumber)
    (is-whole carrot)
    (is-whole tomato)
    (is-workspace cutting_board)
  )
  (:goal (and
    (is-sliced cucumber)
    (is-sliced carrot)
    (is-sliced tomato)
    (at cucumber bowl)
    (at carrot bowl)
    (at tomato bowl)
  ))
)