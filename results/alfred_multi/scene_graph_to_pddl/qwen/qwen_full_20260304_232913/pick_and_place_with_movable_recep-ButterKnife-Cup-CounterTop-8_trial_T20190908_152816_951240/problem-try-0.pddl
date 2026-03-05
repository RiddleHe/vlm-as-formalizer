(define (problem put_glass_and_knife_on_shelf)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        cabinet - receptacle
        bread - object
        soap_dispenser - object
        egg - object
    )
    (:init
        (openable microwave)
        (openable cabinet)
        (opened microwave)
        (inReceptacle knife microwave)
        (inReceptacle bread cabinet)
        (inReceptacle soap_dispenser cabinet)
        (inReceptacle egg cabinet)
    )
    (:goal (and
        (inReceptacle knife cabinet)
        (inReceptacle soap_dispenser cabinet)
    ))
)