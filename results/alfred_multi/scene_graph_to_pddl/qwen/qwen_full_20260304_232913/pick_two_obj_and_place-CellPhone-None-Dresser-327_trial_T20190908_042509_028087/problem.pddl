(define (problem put_phones_on_dresser)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_dresser_at_foot_of_bed - receptacle
        wooden_table_with_books - receptacle
        wooden_table_with_bowl - receptacle
        black_phone_on_table_with_books - object
        black_phone_on_table_with_bowl - object
        black_book_with_gold_design_1 - object
        black_book_with_gold_design_2 - object
        white_bowl_on_table - object
        lamp_on_dresser - object
        alarm_clock_on_dresser - object
        keys_on_dresser - object
        pen_on_dresser - object
    )
    (:init
        (openable wooden_dresser_at_foot_of_bed)
        (not (opened wooden_dresser_at_foot_of_bed))
        (isOn lamp_on_dresser)
        (isToggled lamp_on_dresser)
        (inReceptacle black_book_with_gold_design_1 wooden_table_with_books)
        (inReceptacle black_book_with_gold_design_2 wooden_table_with_books)
        (inReceptacle black_phone_on_table_with_books wooden_table_with_books)
        (inReceptacle white_bowl_on_table wooden_table_with_bowl)
        (inReceptacle lamp_on_dresser wooden_dresser_at_foot_of_bed)
        (inReceptacle alarm_clock_on_dresser wooden_dresser_at_foot_of_bed)
        (inReceptacle keys_on_dresser wooden_dresser_at_foot_of_bed)
        (inReceptacle pen_on_dresser wooden_dresser_at_foot_of_bed)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle black_phone_on_table_with_books wooden_dresser_at_foot_of_bed)
        (inReceptacle black_phone_on_table_with_bowl wooden_dresser_at_foot_of_bed)
    ))
)