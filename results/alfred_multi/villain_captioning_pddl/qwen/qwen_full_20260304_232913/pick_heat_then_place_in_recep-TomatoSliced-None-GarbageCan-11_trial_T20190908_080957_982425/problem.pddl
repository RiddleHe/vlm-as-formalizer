(define (problem put_slice_tomato_in_trash)
    (:domain put_task)
    (:objects
        agent1 - agent
        tomato1 - object
        knife1 - knife
        trash_can1 - receptacle
        kettle1 - object
        toaster1 - object
        microwave1 - receptacle
        sink1 - receptacle
        dishwasher1 - receptacle
        fridge1 - receptacle
        countertop1 - object
        table1 - object
    )
    (:init
        (atLocation agent1 countertop1)  ; agent starts at countertop
        (openable trash_can1)
        (not (opened trash_can1))
        (openable microwave1)
        (not (opened microwave1))
        (openable sink1)
        (not (opened sink1))
        (openable dishwasher1)
        (not (opened dishwasher1))
        (openable fridge1)
        (not (opened fridge1))
        (not (holdsAny agent1))
        (not (isSliced tomato1))
        (not (isClean tomato1))
        (not (isHot tomato1))
        (not (isCool tomato1))
        (not (isOn kettle1))
        (not (isOn toaster1))
        (not (isOn microwave1))
        (not (isOn sink1))
        (not (isOn dishwasher1))
        (not (isOn fridge1))
        (inReceptacle knife1 sink1)  ; knife is in the sink
        (inReceptacle tomato1 countertop1)  ; tomato is on the countertop
        (not (inReceptacle tomato1 trash_can1))  ; tomato not in trash
        (not (inReceptacle tomato1 microwave1))
        (not (inReceptacle tomato1 sink1))
        (not (inReceptacle tomato1 dishwasher1))
        (not (inReceptacle tomato1 fridge1))
    )
    (:goal (and
        (inReceptacle tomato1 trash_can1)
        (isSliced tomato1)
    ))
)