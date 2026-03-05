(define (problem put_cold_lettuce_in_garbage)
    (:domain put_task)
    (:objects
        robot - agent
        garbage_can - receptacle
        fridge - receptacle
        stove - object
        lettuce - object
        knife - object
        tomato - object
        spatula - object
        spoon - object
        plate1 plate2 - object
        frying_pan - object
        mug - object
        book - object
    )
    (:init
        (openable garbage_can)
        (openable fridge)
        (opened garbage_can)  ; assumed open as tomato is visible inside
        (not (opened fridge))
        (inReceptacle tomato garbage_can)
        (atLocation robot stove)  ; initial location can be arbitrary, chosen as stove for example
        (atLocation lettuce countertop)  ; assuming a 'countertop' object exists for location purposes
        (atLocation knife countertop)
        (atLocation spatula countertop)
        (atLocation spoon countertop)
        (atLocation plate1 countertop)
        (atLocation plate2 countertop)
        (atLocation frying_pan countertop)
        (atLocation mug countertop)
        (atLocation book countertop)
        (not (isCool lettuce))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle lettuce garbage_can)
            (isCool lettuce)
        )
    )
)