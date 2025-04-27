(define (problem cooking01)
  (:domain cooking)
  (:objects
    robot1 - robot
    carrot1 carrot2 - vegetable
    tomato1 - vegetable
    knife1 - tool
    bowl1 - bowl
    table1 station1 - location
  )
  (:init
    (at carrot1 station1)
    (at carrot2 station1)
    (at tomato1 table1)
    (at knife1 station1)
    (at bowl1 table1)
    (is-tool knife1)
    (is-vegetable carrot1)
    (is-vegetable carrot2)
    (is-vegetable tomato1)
    (is-bowl bowl1)
    (free robot1)
    (sliced carrot1)
    (sliced carrot2)
  )
  (:goal (and
    (sliced tomato1)
    (in-bowl carrot1 bowl1)
    (in-bowl carrot2 bowl1)
    (in-bowl tomato1 bowl1)
  ))
)