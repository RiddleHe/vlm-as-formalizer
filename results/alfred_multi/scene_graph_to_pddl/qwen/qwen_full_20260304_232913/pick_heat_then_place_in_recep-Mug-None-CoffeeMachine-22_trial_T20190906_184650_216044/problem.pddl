(define (problem put_warm_coffee_cup_in_coffee_maker)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        coffee_maker - receptacle
        coffee_cup - object
        wooden_counter_top - receptacle
    )
    (:init
        (openable microwave)
        (isOn microwave)
        (isToggled microwave)
        (atLocation robot wooden_counter_top)
        (not (holdsAny robot))
        (not (isHot coffee_cup))
        (not (inReceptacle coffee_cup microwave))
        (not (inReceptacle coffee_cup coffee_maker))
        (not (inReceptacle coffee_cup wooden_counter_top))
        (not (holds robot coffee_cup))
    )
    (:goal (and
        (inReceptacle coffee_cup coffee_maker)
        (isHot coffee_cup)
    ))
)