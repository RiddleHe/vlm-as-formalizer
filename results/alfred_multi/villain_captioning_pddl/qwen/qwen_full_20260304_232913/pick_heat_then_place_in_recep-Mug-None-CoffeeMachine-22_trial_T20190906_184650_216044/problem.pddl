(define (problem put_warm_coffee_cup_in_coffee_maker)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        coffee_maker1 - receptacle
        coffee_cup1 - object
    )
    (:init
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 coffee_maker1))
        (not (atLocation agent1 coffee_cup1))
        (not (holdsAny agent1))
        (not (isHot coffee_cup1))
        (not (isSliced coffee_cup1))
        (not (isClean coffee_cup1))
        (not (isCool coffee_cup1))
        (not (isOn microwave1))
        (not (isToggled microwave1))
        (not (opened microwave1))
        (not (opened coffee_maker1))
        (not (inReceptacle coffee_cup1 microwave1))
        (not (inReceptacle coffee_cup1 coffee_maker1))
        (openable microwave1)
        (openable coffee_maker1)
    )
    (:goal (and
        (inReceptacle coffee_cup1 coffee_maker1)
        (isHot coffee_cup1)
    ))
)