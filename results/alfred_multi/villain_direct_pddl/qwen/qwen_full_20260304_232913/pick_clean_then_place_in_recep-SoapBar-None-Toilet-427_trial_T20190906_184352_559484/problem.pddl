(define (problem put_clean_soap_on_toilet)
    (:domain put_task)
    (:objects
        robot - agent
        sink - sink
        toilet - receptacle
        soap - object
    )
    (:init
        (atLocation robot sink)
        (inReceptacle soap sink)
        (not (isClean soap))
    )
    (:goal (and
        (inReceptacle soap toilet)
        (isClean soap)
    ))
)