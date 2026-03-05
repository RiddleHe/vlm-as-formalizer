(define (problem move_credit_cards_to_table)
  (:domain put_task)
  (:objects
    robot - agent
    tvstand - receptacle
    table - receptacle
    card1 - object
    card2 - object
  )

  (:init
    ;; credit cards start on/in the television stand surface
    (inReceptacle card1 tvstand)
    (inReceptacle card2 tvstand)
  )

  (:goal
    (and
      (inReceptacle card1 table)
      (inReceptacle card2 table)
    )
  )
)