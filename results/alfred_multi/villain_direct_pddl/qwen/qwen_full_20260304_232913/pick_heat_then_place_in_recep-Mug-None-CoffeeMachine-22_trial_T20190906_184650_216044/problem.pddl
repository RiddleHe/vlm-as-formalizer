(define (problem put_warm_coffee_cup_in_coffee_maker)
    (:domain put_task)
    (:objects
        robot - agent
        coffee_cup - object
        coffee_maker - receptacle
        microwave - microwave
    )
    (:init
        (atLocation robot coffee_cup)
        (not (holdsAny robot))
        (not (isHot coffee_cup))
        (not (opened coffee_maker))
        (openable coffee_maker)
        (atLocation robot microwave)
    )
    (:goal
        (and
            (inReceptacle coffee_cup coffee_maker)
            (isHot coffee_cup)
        )
    )
)