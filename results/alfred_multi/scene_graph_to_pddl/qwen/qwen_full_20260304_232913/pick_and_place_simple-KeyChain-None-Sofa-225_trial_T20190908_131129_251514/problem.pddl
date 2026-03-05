(define (problem move_keys_to_loveseat)
    (:domain put_task)
    (:objects
        robot - agent
        white_table - receptacle
        black_loveseat - receptacle
        open_cardboard_box - receptacle
        set_of_keys - object
        green_chair - object
    )
    (:init
        (openable white_table)
        (openable black_loveseat)
        (openable open_cardboard_box)
        (opened open_cardboard_box)
        (inReceptacle set_of_keys white_table)
    )
    (:goal (and (inReceptacle set_of_keys black_loveseat)))
)