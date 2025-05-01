(define (problem slice-and-place-vegetables)
  (:domain cooking)
  (:objects
    robot1
    robot2
    knife
    cucumber - vegetable
    carrot - vegetable
    tomato - vegetable
    bowl
    table
  )
  (:init
    (is_vegetable cucumber)
    (is_vegetable carrot)
    (is_vegetable tomato)
    (is_tool knife)
    (is_bowl bowl)
    (at cucumber table)
    (at carrot table)
    (at tomato table)
    (at bowl table)
    (at knife table)
    ;; No robot holding anything initially
  )
  (:goal (and
    (sliced cucumber)
    (sliced carrot)
    (sliced tomato)
    (at cucumber bowl)
    (at carrot bowl)
    (at tomato bowl)
  ))
)