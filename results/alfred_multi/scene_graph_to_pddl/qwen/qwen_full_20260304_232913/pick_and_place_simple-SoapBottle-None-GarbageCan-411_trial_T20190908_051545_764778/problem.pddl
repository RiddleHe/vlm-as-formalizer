(define (problem put_pump_bottle_in_garbage_can)
    (:domain put_task)
    (:objects
        robot - agent
        green_sink - sink
        green_garbage_can - receptacle
        pink_soap_bar - object
        purple_pump_bottle - object
        brown_soap_dispenser - object
        white_toilet_paper_roll - object
    )
    (:init
        (openable green_garbage_can)
        (openable green_sink)
        (inReceptacle pink_soap_bar green_sink)
        (inReceptacle purple_pump_bottle brown_soap_dispenser)
        (not (atLocation robot green_garbage_can))
        (not (atLocation robot green_sink))
        (not (atLocation robot purple_pump_bottle))
        (not (holdsAny robot))
    )
    (:goal
        (inReceptacle purple_pump_bottle green_garbage_can)
    )
)