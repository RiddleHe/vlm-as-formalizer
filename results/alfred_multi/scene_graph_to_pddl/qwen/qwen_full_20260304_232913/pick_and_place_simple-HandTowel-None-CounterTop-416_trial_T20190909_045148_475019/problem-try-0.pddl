(define (problem put_hand_towel_on_counter)
    (:domain put_task)
    (:objects
        robot - agent
        gray_marble_sink - sink
        hand_towel - object
        towel_rack - object
        soap_bar - object
        soap_bottle - object
        purple_bottle - object
    )
    (:init
        (inReceptacle hand_towel towel_rack)
        (not (atLocation robot gray_marble_sink))
        (not (atLocation robot towel_rack))
        (not (holdsAny robot))
    )
    (:goal (and
        (atLocation robot gray_marble_sink)
        (not (inReceptacle hand_towel towel_rack))
        (inReceptacle hand_towel gray_marble_sink)
    ))
)