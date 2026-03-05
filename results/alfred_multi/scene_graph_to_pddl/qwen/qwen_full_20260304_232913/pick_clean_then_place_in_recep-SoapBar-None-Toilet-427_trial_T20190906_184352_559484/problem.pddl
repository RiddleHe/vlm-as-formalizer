(define (problem put_clean_soap_on_toilet)
    (:domain put_task)
    (:objects
        agent
        sink - receptacle
        bathtub - receptacle
        toilet tank - receptacle
        pink soap bar - object
        green soap bar - object
        yellow toothbrush - object
        white toilet paper roll - object
        knife - object
    )
    (:init
        (inReceptacle pink soap bar bathtub)
        (inReceptacle green soap bar bathtub)
        (inReceptacle yellow toothbrush toilet tank)
        (inReceptacle white toilet paper roll toilet tank)
        (atLocation agent sink) ; assuming agent starts at sink for convenience, though not specified
    )
    (:goal (and
        (inReceptacle pink soap bar toilet tank)
        (isClean pink soap bar)
    ))
)