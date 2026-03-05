(define (problem move_keys)
    (:domain put_task)
    (:objects
        robot - agent
        white_table wooden_dresser - receptacle
        black_smartphone_on_white_table yellow_pencil_on_white_table brown_alarm_clock_on_white_table cd_on_white_table - object
        black_smartphone_on_wooden_dresser blue_card_on_wooden_dresser checkerboard_on_wooden_dresser - object
    )
    (:init
        (openable white_table)
        (openable wooden_dresser)
        (inReceptacle black_smartphone_on_white_table white_table)
        (inReceptacle yellow_pencil_on_white_table white_table)
        (inReceptacle brown_alarm_clock_on_white_table white_table)
        (inReceptacle cd_on_white_table white_table)
        (inReceptacle black_smartphone_on_wooden_dresser wooden_dresser)
        (inReceptacle blue_card_on_wooden_dresser wooden_dresser)
        (inReceptacle checkerboard_on_wooden_dresser wooden_dresser)
        (isOn brown_alarm_clock_on_white_table)
        (isToggled brown_alarm_clock_on_white_table)
    )
    (:goal (and
        (inReceptacle black_smartphone_on_wooden_dresser white_table)
        (inReceptacle blue_card_on_wooden_dresser white_table)
    ))
)