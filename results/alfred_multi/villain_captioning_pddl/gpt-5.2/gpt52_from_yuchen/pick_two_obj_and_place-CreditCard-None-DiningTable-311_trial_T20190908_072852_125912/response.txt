(define (problem move_two_credit_cards_to_table)
  (:domain put_task)

  (:objects
    robot - agent

    tv_stand - receptacle
    table - receptacle

    credit_card_1 - object
    credit_card_2 - object

    pencil - object
    blue_stick - object

    laptop - object
    mug - object
    keys - object
    tape_dispenser - object
    book - object
  )

  (:init
    ;; Robot starts not at any location and holds nothing.
    ;; (No atLocation facts initially)
    ;; (No holds/holdsAny facts initially)

    ;; Receptacle contents / placements
    (inReceptacle credit_card_1 tv_stand)
    (inReceptacle credit_card_2 tv_stand)
    (inReceptacle pencil tv_stand)
    (inReceptacle blue_stick tv_stand)

    (inReceptacle laptop table)
    (inReceptacle mug table)
    (inReceptacle keys table)
    (inReceptacle tape_dispenser table)
    (inReceptacle book table)
  )

  (:goal
    (and
      (inReceptacle credit_card_1 table)
      (inReceptacle credit_card_2 table)
    )
  )
)