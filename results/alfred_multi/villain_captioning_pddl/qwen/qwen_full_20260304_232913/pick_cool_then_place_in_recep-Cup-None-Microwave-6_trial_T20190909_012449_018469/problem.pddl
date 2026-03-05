(define (problem place_cooled_cup_in_microwave)
    (:domain put_task)
    (:objects
        agent1 - agent
        fridge1 - fridge
        microwave1 - microwave
        cup1 - object
    )
    (:init
        (openable fridge1)
        (not (opened fridge1))
        (not (atLocation agent1 fridge1))
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 cup1))
        (not (holdsAny agent1))
        (not (isCool cup1))
        (not (isHot cup1))
        (not (isClean cup1))
        (not (isSliced cup1))
        (not (isOn microwave1))
        (not (isToggled microwave1))
        (not (inReceptacle cup1 fridge1))
        (not (inReceptacle cup1 microwave1))
        (not (holds agent1 cup1))
    )
    (:goal (and
        (inReceptacle cup1 microwave1)
        (isCool cup1)
    ))
)