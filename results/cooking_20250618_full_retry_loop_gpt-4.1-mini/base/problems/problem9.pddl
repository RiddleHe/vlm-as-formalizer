(define (problem cooking_task)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    knife spatula spoon - tool
    carrot cucumber - vegetable
    bowl cutting_board counter - location
  )
  (:init
    ; robots
    (free robot1)
    (carry robot2 knife)
    ; tools
    (can-cut knife)
    (available spatula)
    (available spoon)
    ; vegetables
    (is-whole carrot)
    (available carrot)
    (is-sliced cucumber)
    (available cucumber)
    ; object locations
    (at carrot counter)
    (at cucumber counter)
    (at bowl counter)
    ; workspace
    (is-workspace cutting_board)
  )
  (:goal (and
    (is-sliced carrot)
    (at carrot bowl)
    (at cucumber bowl)
  ))
)