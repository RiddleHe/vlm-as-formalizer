(define (problem cooking_problem_2)
  (:domain cooking)
  (:objects 
    robot1 robot2 - robot
    knife spatula spoon - tool
    cucumber carrot tomato - vegetable
    bowl cutting_board counter - location
  )
  (:init 
    (free robot2) ; robot2 is free, robot1 holds the knife
    (carry robot1 knife)
    (not (free robot1))
    
    (available cucumber)
    (available carrot)
    (available tomato)
    
    (can-cut knife)
    
    (at cucumber cutting_board)
    (at carrot cutting_board)
    (at tomato cutting_board)
    (at bowl counter)
    
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