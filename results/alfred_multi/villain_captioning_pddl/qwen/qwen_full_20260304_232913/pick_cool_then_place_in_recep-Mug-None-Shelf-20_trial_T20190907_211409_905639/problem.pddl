(define (problem chill_mug_and_set_on_rack)
    (:domain put_task)
    (:objects
        agent1 - agent
        mug - object
        coffee_maker - object
        toaster - object
        fridge - fridge
        rack - receptacle
        countertop - object
    )
    (:init
        (atLocation agent1 countertop)
        (inReceptacle mug coffee_maker)
        (openable fridge)
        (not (opened fridge))
        (not (isCool mug))
        (not (holdsAny agent1))
    )
    (:goal (and
        (inReceptacle mug rack)
        (isCool mug)
    ))
)