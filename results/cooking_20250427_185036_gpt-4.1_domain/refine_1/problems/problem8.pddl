(define (problem cooking2)
  (:domain cooking)
  (:objects
    robot1 - robot
    cucumber1 - vegetable
    tomato1 - vegetable
    tomato2 - vegetable
    knife1 - tool
    bowl1 - bowl
    board1 - board
  )
  (:init
    (at cucumber1 board1)
    (at tomato1 board1)
    (at tomato2 board1)
    (at knife1 board1)
    (at bowl1 board1)
    (clear cucumber1)
    (clear tomato1)
    (clear tomato2)
    (clear knife1)
    (is-tool knife1)
    (is-vegetable cucumber1)
    (is-vegetable tomato1)
    (is-vegetable tomato2)
    (unsliced cucumber1)
    (unsliced tomato1)
    (unsliced tomato2)
  )
  (:goal (and
    (sliced cucumber1)
    (in-bowl cucumber1 bowl1)
    (in-bowl tomato1 bowl1)
    (in-bowl tomato2 bowl1)
  ))
)