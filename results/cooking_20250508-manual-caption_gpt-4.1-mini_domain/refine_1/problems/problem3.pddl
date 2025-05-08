(define (problem slice_carrot)
  (:domain cooking)
  (:objects
    robot1
    robot2
    bowl - object
    carrot - vegetable
    knife - tool
    counter
    cutting_board - location
  )
  (:init
    (at bowl counter)
    (at carrot counter)
    (at cutting_board counter)
    (free robot1)
    (holding robot2 knife)
    (not (sliced carrot))
  )
  (:goal
    (and
      (sliced carrot)
      (at carrot bowl)
    )
  )
)