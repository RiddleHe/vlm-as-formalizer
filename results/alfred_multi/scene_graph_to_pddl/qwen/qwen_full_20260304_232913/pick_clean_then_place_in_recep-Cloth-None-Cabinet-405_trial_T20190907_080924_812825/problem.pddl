(define (problem put_rinsed_cloth_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        sink - sink
        cabinet - receptacle
        trash_bin - receptacle
        cloth - object
        candle - object
        spray_bottle - object
        soap_bar - object
    )
    (:init
        (openable cabinet)
        (not (opened cabinet))
        (inReceptacle soap_bar sink)
        (inReceptacle candle cabinet)
        (inReceptacle spray_bottle cabinet)
        (not (holdsAny robot))
        (not (atLocation robot sink))
        (not (atLocation robot cabinet))
        (not (isClean cloth))
    )
    (:goal (and
        (inReceptacle cloth cabinet)
        (isClean cloth)
    ))
)