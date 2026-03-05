(define (problem put_hand_towel_on_counter)
    (:domain put_task)
    (:objects
        robot - agent
        sink - sink
        hand_towel - object
        counter - receptacle
    )
    (:init
        (atLocation robot sink)
        (inReceptacle hand_towel sink)
    )
    (:goal (and (inReceptacle hand_towel counter)))
)