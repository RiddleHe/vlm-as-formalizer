(define (problem put_chilled_bowl_in_sink)
    (:domain put_task)
    (:objects
        agent1 - agent
        black_bowl - object
        sink1 - sink
        fridge1 - fridge
        tomato1 - object
        lettuce1 - object
        cup1 - object
        salt_shaker1 - object
        pepper_shaker1 - object
        soap_dispenser1 - object
        knife1 - knife
        fork1 - object
        potted_plant1 - object
        egg1 - object
    )
    (:init
        (atLocation agent1 black_bowl)
        (not (holdsAny agent1))
        (not (holds agent1 black_bowl))
        (not (isCool black_bowl))
        (not (inReceptacle black_bowl sink1))
        (openable fridge1)
        (not (opened fridge1))
        (inReceptacle egg1 sink1)
        (atLocation agent1 black_bowl)
    )
    (:goal (and
        (inReceptacle black_bowl sink1)
        (isCool black_bowl)
    ))
)