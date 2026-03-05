(define (problem move_phone_to_endtable_shelf)
  (:domain put_task)

  (:objects
    robot - agent

    end_table_1 - receptacle
    bookshelf_1 - object

    disc_1 disc_2 clock_1 phone_1 - object
  )

  (:init
    ;; Agent starts not at any object's location (no atLocation facts for robot).

    ;; Receptacle relations (items currently on/in the end table)
    (inReceptacle disc_1 end_table_1)
    (inReceptacle disc_2 end_table_1)
    (inReceptacle clock_1 end_table_1)

    ;; Phone is not visible; assume it exists but is not already in the end table.
    ;; No initial inReceptacle for phone_1.

    ;; End table shelf/cubby is open by design; not modeled as openable/opened.
  )

  (:goal
    (and
      (inReceptacle phone_1 end_table_1)
    )
  )
)