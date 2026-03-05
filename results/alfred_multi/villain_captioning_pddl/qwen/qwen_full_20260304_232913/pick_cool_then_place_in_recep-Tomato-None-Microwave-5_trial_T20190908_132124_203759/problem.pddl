(define (problem put_chilled_tomato_in_microwave)
    (:domain put_task)
    (:objects
        agent1 - agent
        fridge1 - fridge
        microwave1 - microwave
        oven1 - receptacle
        dog_figurine1 - object
        spatula1 - object
        pot1 - object
        pot2 - object
        cup1 - object
        tomato1 - object
    )
    (:init
        (openable fridge1)
        (openable microwave1)
        (openable oven1)
        (opened fridge1)
        (not (opened microwave1))
        (opened oven1)
        (atLocation agent1 fridge1)
        (not (holdsAny agent1))
        (not (isCool tomato1))
        (not (isHot tomato1))
        (not (isClean tomato1))
        (not (isSliced tomato1))
        (not (isOn microwave1))
        (not (isToggled microwave1))
        (not (inReceptacle tomato1 fridge1))
        (not (inReceptacle tomato1 microwave1))
        (not (inReceptacle tomato1 oven1))
    )
    (:goal (and
        (inReceptacle tomato1 microwave1)
        (isCool tomato1)
    ))
)