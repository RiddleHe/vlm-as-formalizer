(define (problem put_cold_lettuce_in_garbage_can)
    (:domain put_task)
    (:objects
        agent1 - agent
        lettuce - object
        fridge - fridge
        garbage_can - receptacle
        knife - knife
    )
    (:init
        (atLocation agent1 garbage_can)
        (inReceptacle lettuce garbage_can)
        (openable fridge)
        (not (opened fridge))
        (not (isCool lettuce))
    )
    (:goal (and
        (inReceptacle lettuce garbage_can)
        (isCool lettuce)
    ))
)