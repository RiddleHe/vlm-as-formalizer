(define (problem cooking_task)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    knife spatula spoon - tool
    carrot tomato cucumber dressing_bottle - vegetable
    bowl cutting_board counter - location
  )
  (:init
    ; locations
    (is-workspace cutting_board)

    ; carrot and tomato are whole and available at counter
    (is-whole carrot)
    (available carrot)
    (at carrot counter)

    (is-whole tomato)
    (available tomato)
    (at tomato counter)

    ; cucumber and dressing bottle available and whole at counter
    (is-whole cucumber)
    (available cucumber)
    (at cucumber counter)

    (is-whole dressing_bottle)
    (available dressing_bottle)
    (at dressing_bottle counter)

    ; robots
    (free robot1)
    (carry robot2 knife)
    (can-cut knife)
  )
  (:goal
    (and
      (is-sliced carrot)
      (at carrot bowl)
      (is-sliced tomato)
      (at tomato bowl)
    )
  )
)