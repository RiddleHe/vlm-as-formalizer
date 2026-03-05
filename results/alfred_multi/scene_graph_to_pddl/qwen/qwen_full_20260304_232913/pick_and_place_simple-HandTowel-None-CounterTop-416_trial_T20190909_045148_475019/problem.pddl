(define (problem put_hand_towel_on_counter)
    (:domain put_task)
    (:objects
        robot - agent
        gray_marble_sink - sink
        hand_towel - object
        towel_rack - object
        purple_bottle - object
        gray_soap_dispenser - object
        small_golden_object - object
        orange_cylindrical_object - object
    )
    (:init
        (inReceptacle hand_towel towel_rack)
        (not (atLocation robot gray_marble_sink))
        (not (atLocation robot towel_rack))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (atLocation robot gray_marble_sink)
            (inReceptacle hand_towel gray_marble_sink)
        )
    )
)