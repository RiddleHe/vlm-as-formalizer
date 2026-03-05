(define (problem put_spray_bottle_on_toilet)
    (:domain put_task)
    (:objects
        robot - agent
        sink_bowl - sink
        spray_bottle - object
        toilet_paper - object
        toothbrush - object
        towel - object
        mirror - object
        toilet - receptacle  ; assuming toilet is a receptacle based on instruction
    )
    (:init
        (atLocation robot sink_bowl)  ; robot starts near sink
        (inReceptacle spray_bottle sink_bowl)  ; spray bottle is initially in the sink bowl
        (inReceptacle toilet_paper sink_bowl)  ; toilet paper is in the sink bowl
        (inReceptacle toothbrush sink_bowl)    ; toothbrush is in the sink bowl
        (inReceptacle towel sink_bowl)         ; towel is in the sink bowl
        (openable toilet)                    ; toilet is openable
        (not (opened toilet))                ; toilet is initially closed
        (not (holdsAny robot))               ; robot is not holding anything
    )
    (:goal
        (and
            (inReceptacle spray_bottle toilet)  ; spray bottle should be on top of the toilet
        )
    )
)