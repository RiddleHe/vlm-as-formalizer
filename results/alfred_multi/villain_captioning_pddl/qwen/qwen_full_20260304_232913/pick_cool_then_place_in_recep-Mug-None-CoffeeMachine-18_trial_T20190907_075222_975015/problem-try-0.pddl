(define (problem cool_cup)
    (:domain put_task)
    (:objects
        robot - agent
        fridge - fridge
        coffee_maker - object
        cup - object
    )
    (:init
        (openable fridge)
        (not (opened fridge))
        (not (atLocation robot fridge))
        (not (atLocation robot coffee_maker))
        (not (atLocation robot cup))
        (not (holdsAny robot))
        (not (holds robot cup))
        (not (inReceptacle cup fridge))
        (not (isCool cup))
        (isOn coffee_maker)
        (isToggled coffee_maker)
        (atLocation coffee_maker cup)  ; cup is on coffee maker
    )
    (:goal (and
        (isCool cup)
        (inReceptacle cup fridge)
    ))
)