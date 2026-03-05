(define (problem cool_cup)
    (:domain put_task)
    (:objects
        robot - agent
        fridge - fridge
        coffee_maker - receptacle
        cup - object
    )
    (:init
        (openable fridge)
        (not (opened fridge))
        (atLocation robot coffee_maker)
        (inReceptacle cup coffee_maker)
        (not (isCool cup))
    )
    (:goal (and (isCool cup)))
)