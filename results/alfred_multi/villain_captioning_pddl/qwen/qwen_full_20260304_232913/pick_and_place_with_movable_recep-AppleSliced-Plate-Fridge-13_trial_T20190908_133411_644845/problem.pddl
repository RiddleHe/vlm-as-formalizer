(define (problem put_plate_knife_apple_in_fridge)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        plate - object
        apple_piece - object
        bowl - object
        salt_shaker - object
        lettuce - object
        countertop - receptacle
    )
    (:init
        (openable microwave)
        (openable fridge)
        (not (opened microwave))
        (not (opened fridge))
        (not (atLocation agent1 microwave))
        (not (atLocation agent1 fridge))
        (not (atLocation agent1 sink))
        (not (atLocation agent1 knife))
        (not (atLocation agent1 plate))
        (not (atLocation agent1 apple_piece))
        (not (holdsAny agent1))
        (not (isClean knife))
        (not (isClean plate))
        (not (isClean apple_piece))
        (not (isHot knife))
        (not (isHot plate))
        (not (isHot apple_piece))
        (not (isCool knife))
        (not (isCool plate))
        (not (isCool apple_piece))
        (not (isOn microwave))
        (not (isOn fridge))
        (not (isSliced knife))
        (not (isSliced plate))
        (not (isSliced apple_piece))
        (inReceptacle knife countertop)
        (inReceptacle plate countertop)
        (inReceptacle apple_piece countertop)
        (inReceptacle bowl countertop)
        (inReceptacle salt_shaker countertop)
        (inReceptacle lettuce countertop)
    )
    (:goal (and
        (inReceptacle plate fridge)
        (inReceptacle knife fridge)
        (inReceptacle apple_piece fridge)
    ))
)