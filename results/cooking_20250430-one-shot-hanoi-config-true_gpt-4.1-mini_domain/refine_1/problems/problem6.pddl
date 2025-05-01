(define (problem cooking_task2)
  (:domain cooking)
  (:objects
    robot1
    robot2
    cucumber carrot - vegetable
    knife - tool
    bowl - object
    table - location
  )
  (:init
    (holding robot1 knife)
    (is-knife knife)
    (at cucumber table)
    (at carrot table)
    (is-bowl bowl)
    (at bowl table)
    (not (sliced cucumber))
    (not (sliced carrot))
  )
  (:goal (and
    (sliced cucumber)
    (sliced carrot)
    (at cucumber bowl)
    (at carrot bowl)
  ))
)