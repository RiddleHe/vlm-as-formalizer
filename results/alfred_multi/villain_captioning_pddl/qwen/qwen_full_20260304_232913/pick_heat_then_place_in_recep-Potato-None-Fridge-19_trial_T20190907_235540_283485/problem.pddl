(define (problem put_heated_potato_in_fridge)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        fridge1 - fridge
        potato1 - object
        knife1 - knife
        table1 - object
        countertop1 - object
    )
    (:init
        (openable microwave1)
        (openable fridge1)
        (not (opened microwave1))
        (not (opened fridge1))
        (not (isSliced potato1))
        (not (isHot potato1))
        (not (isCool potato1))
        (not (holdsAny agent1))
        (not (atLocation agent1 table1))
        (not (atLocation agent1 countertop1))
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 fridge1))
        (inReceptacle potato1 table1)
        (inReceptacle knife1 table1)
        (inReceptacle microwave1 countertop1)
        (inReceptacle fridge1 countertop1) ; assuming fridge is on the same level as countertop for location purposes
    )
    (:goal (and
        (inReceptacle potato1 fridge1)
        (isHot potato1)
        (isSliced potato1)
    ))
)