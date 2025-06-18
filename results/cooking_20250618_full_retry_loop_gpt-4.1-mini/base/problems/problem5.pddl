(define (problem cooking_task1)
  (:domain cooking)
  (:objects
    robot1 robot2 - robot
    knife spatula spoon - tool
    cucumber tomato dressing_bottle - vegetable
    bowl cutting_board counter - location
  )
  (:init
    ; Robot states
    (free robot1)
    (carry robot2 knife)

    ; Tool cutting ability
    (can-cut knife)

    ; Vegetables states - initially whole, so we mark only is-whole
    (is-whole cucumber)
    (is-whole tomato)

    ; Location predicates
    (at cucumber counter)
    (at tomato counter)
    (at bowl counter)
    (at cutting_board counter)
    (is-workspace cutting_board)

    ; Availability states
    (available cucumber)
    (available tomato)
    (available knife)
    (available spatula)
    (available spoon)
  )
  (:goal
    (and
      (is-sliced cucumber)
      (is-sliced tomato)
      (at cucumber bowl)
      (at tomato bowl)
    )
  )
)