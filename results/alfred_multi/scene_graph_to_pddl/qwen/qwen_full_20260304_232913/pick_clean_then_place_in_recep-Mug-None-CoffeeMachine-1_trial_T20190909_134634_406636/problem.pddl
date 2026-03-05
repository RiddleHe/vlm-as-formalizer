(define (problem wash_mug_and_place_in_coffee_maker)
    (:domain put_task)
    (:objects
        robot - agent
        sink - sink
        coffee_maker - receptacle
        mug - object
        fork - object
        knife - object
        wine_bottle - object
        toaster - receptacle
        cabinet_drawer - receptacle
        cabinet_door - receptacle
    )
    (:init
        (openable sink)
        (openable cabinet_drawer)
        (openable cabinet_door)
        (isOn coffee_maker)
        (isOn toaster)
        (isToggled coffee_maker)
        (isToggled toaster)
        (inReceptacle mug coffee_maker)
        (inReceptacle fork sink)
        (inReceptacle knife sink)
        (inReceptacle wine_bottle sink) ; assuming wine bottle is on countertop near sink as per image
        (not (isClean mug))
        (not (holdsAny robot))
        (not (atLocation robot sink))
        (not (atLocation robot coffee_maker))
    )
    (:goal (and
        (inReceptacle mug coffee_maker)
        (isClean mug)
    ))
)