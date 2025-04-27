(define (problem cooking-image01)
  (:domain cooking)
  (:objects
    robot1 - robot
    tomato1 - vegetable
    carrot1 carrot2 - vegetable
    knife1 - tool
    bowl1 - bowl
    cuttingboard1 tray1 - location
  )
  (:init
    (at tomato1 tray1)
    (at carrot1 cuttingboard1)
    (at carrot2 cuttingboard1)
    (at knife1 cuttingboard1)
    (at bowl1 tray1)
    (is-tool knife1)
    (is-vegetable tomato1)
    (is-vegetable carrot1)
    (is-vegetable carrot2)
    (is-bowl bowl1)
    (free robot1)
    (sliced carrot1)
    (sliced carrot2)
  )
  (:goal (and
    (sliced tomato1)
    (in-bowl tomato1 bowl1)
    (in-bowl carrot1 bowl1)
    (in-bowl carrot2 bowl1)
  ))
)