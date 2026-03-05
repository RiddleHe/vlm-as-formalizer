(define (problem move_two_keysets_dresser_to_white_table)
  (:domain put_task)

  (:objects
    robot - agent

    white_table - receptacle
    wooden_dresser - receptacle

    keys_set_a - object
    keys_set_b - object

    checkered_board - object
    dresser_phone - object

    table_phone - object
    digital_clock - object
    pencil_1 - object
    pencil_2 - object
    pink_round_item - object
  )

  (:init
    ;; robot starts not at any object's location (so no atLocation facts)

    ;; objects on wooden dresser (source)
    (inReceptacle keys_set_a wooden_dresser)
    (inReceptacle keys_set_b wooden_dresser)
    (inReceptacle checkered_board wooden_dresser)
    (inReceptacle dresser_phone wooden_dresser)

    ;; objects on white table (destination)
    (inReceptacle table_phone white_table)
    (inReceptacle digital_clock white_table)
    (inReceptacle pencil_1 white_table)
    (inReceptacle pencil_2 white_table)
    (inReceptacle pink_round_item white_table)
  )

  (:goal
    (and
      (inReceptacle keys_set_a white_table)
      (inReceptacle keys_set_b white_table)
    )
  )
)