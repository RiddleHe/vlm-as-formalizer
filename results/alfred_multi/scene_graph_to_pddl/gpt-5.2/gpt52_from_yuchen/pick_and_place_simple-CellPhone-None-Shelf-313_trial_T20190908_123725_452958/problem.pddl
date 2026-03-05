(define (problem put_phone_on_end_table_shelf)
  (:domain put_task)
  (:objects
    robot - agent
    black_end_table_with_open_shelf - receptacle
    tall_black_bookshelf - receptacle
    red_flip_phone_on_end_table_top - object
    left_compact_disc_on_end_table_top - object
    right_compact_disc_on_end_table_top - object
  )
  (:init
    ;; Receptacles present (no openable/opened info given)

    ;; Objects initially on/at the end table (modeled as being in the receptacle)
    (inReceptacle red_flip_phone_on_end_table_top black_end_table_with_open_shelf)
    (inReceptacle left_compact_disc_on_end_table_top black_end_table_with_open_shelf)
    (inReceptacle right_compact_disc_on_end_table_top black_end_table_with_open_shelf)

    ;; Robot starts not at any location and holds nothing (no atLocation/holds/holdsAny facts)
  )
  (:goal
    (and
      (inReceptacle red_flip_phone_on_end_table_top black_end_table_with_open_shelf)
    )
  )
)