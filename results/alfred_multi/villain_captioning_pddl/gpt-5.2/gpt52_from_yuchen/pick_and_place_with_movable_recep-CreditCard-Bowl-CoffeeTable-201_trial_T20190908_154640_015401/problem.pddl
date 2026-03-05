(define (problem put_bowl_creditcard_on_glasstable)
  (:domain put_task)

  (:objects
    robot - agent

    glass_table - receptacle
    bowl - receptacle
    credit_card - object

    tissue_box - object
    tray - object
    remote - object
  )

  (:init
    ;; receptacle properties
    ;; glass table and bowl can hold items
    ;; (no openable/opened states visible/applicable)

    ;; initial containment / placement (treat "on top of" as inReceptacle)
    (inReceptacle bowl glass_table)
    (inReceptacle tissue_box glass_table)
    (inReceptacle tray glass_table)
    (inReceptacle remote glass_table)

    ;; credit card is on the lower shelf area of the glass table (still in the table receptacle),
    ;; and not inside the bowl
    (inReceptacle credit_card glass_table)

    ;; agent starts not at any object's location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle credit_card bowl)
      (inReceptacle bowl glass_table)
    )
  )
)