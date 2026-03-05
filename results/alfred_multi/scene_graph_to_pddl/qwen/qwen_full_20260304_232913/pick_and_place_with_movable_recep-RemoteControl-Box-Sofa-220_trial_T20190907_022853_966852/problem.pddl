(define (problem put_remote_in_box_on_couch)
    (:domain put_task)
    (:objects
        robot - agent
        open_cardboard_box - receptacle
        green_checkered_couch - receptacle
        gray_remote_control - object
        golden_cushion - object
        green_candle - object
        brown_remote_control - object
        small_brown_box_with_gray_object_inside - object
    )
    (:init
        (openable open_cardboard_box)
        (opened open_cardboard_box)
        (inReceptacle gray_remote_control open_cardboard_box)
        (inReceptacle small_brown_box_with_gray_object_inside open_cardboard_box)
        (inReceptacle golden_cushion green_checkered_couch)
        (atLocation robot open_cardboard_box) ; assuming robot starts near the box for practicality
    )
    (:goal (and
        (inReceptacle open_cardboard_box green_checkered_couch)
    ))
)