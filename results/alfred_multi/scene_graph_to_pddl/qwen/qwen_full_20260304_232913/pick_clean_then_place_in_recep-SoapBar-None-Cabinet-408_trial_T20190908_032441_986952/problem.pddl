(define (problem put_wet_soap_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        sink - sink
        cabinet - receptacle
        soap - object
        toilet_tank - receptacle
    )
    (:init
        (openable cabinet)
        (openable toilet_tank)
        (inReceptacle soap sink)
        (not (atLocation robot cabinet))
        (not (atLocation robot sink))
        (not (holdsAny robot))
        (not (opened cabinet))
        (not (isClean soap))
    )
    (:goal (and
        (inReceptacle soap cabinet)
        (isClean soap)
    ))
)