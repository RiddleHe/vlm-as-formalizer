(define (problem put_cold_lettuce_in_garbage)
    (:domain put_task)
    (:objects
        agent - agent
        lettuce - object
        garbage-can - receptacle
        fridge - receptacle
        knife - object
        tomato - object
    )
    (:init
        (openable garbage-can)
        (openable fridge)
        (not (opened garbage-can))
        (not (opened fridge))
        (inReceptacle tomato garbage-can)
        (not (isCool lettuce))
        (not (isSliced lettuce))
        (not (holdsAny agent))
        (not (atLocation agent lettuce))
        (not (atLocation agent fridge))
        (not (atLocation agent garbage-can))
        (atLocation lettuce countertop)
        (atLocation knife countertop)
        (atLocation fridge kitchen-wall)
        (atLocation garbage-can floor)
    )
    (:goal
        (and
            (inReceptacle lettuce garbage-can)
            (isCool lettuce)
        )
    )
)