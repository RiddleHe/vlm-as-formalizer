(define (problem place_cooled_bread_slice_in_microwave)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        fridge1 - fridge
        sink1 - sink
        knife1 - knife
        bread1 - object
        bread2 - object
        tomato1 - object
        salt_shaker1 - object
        pepper_shaker1 - object
        paper_towel_roll1 - object
        egg1 - object
        egg2 - object
        spoon1 - object
        toaster1 - object
        bottle1 - object
        mug1 - object
        mug2 - object
        cup1 - object
        table1 - object
        countertop1 - object
    )
    (:init
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 fridge1))
        (not (atLocation agent1 sink1))
        (not (atLocation agent1 knife1))
        (not (atLocation agent1 bread1))
        (not (atLocation agent1 bread2))
        (not (atLocation agent1 tomato1))
        (not (atLocation agent1 salt_shaker1))
        (not (atLocation agent1 pepper_shaker1))
        (not (atLocation agent1 paper_towel_roll1))
        (not (atLocation agent1 egg1))
        (not (atLocation agent1 egg2))
        (not (atLocation agent1 spoon1))
        (not (atLocation agent1 toaster1))
        (not (atLocation agent1 bottle1))
        (not (atLocation agent1 mug1))
        (not (atLocation agent1 mug2))
        (not (atLocation agent1 cup1))
        (not (atLocation agent1 table1))
        (not (atLocation agent1 countertop1))

        (openable microwave1)
        (openable fridge1)
        (opened microwave1) ; Assuming microwave is initially open for simplicity, as not specified
        (opened fridge1) ; Assuming fridge is initially open for simplicity, as not specified

        (not (holdsAny agent1))
        (not (isClean bread1))
        (not (isClean bread2))
        (not (isHot bread1))
        (not (isHot bread2))
        (not (isCool bread1))
        (not (isCool bread2))
        (not (isSliced bread1))
        (not (isSliced bread2))
        (not (isOn microwave1))
        (not (isToggled microwave1))
        (not (isOn fridge1))
        (not (isToggled fridge1))

        (atLocation agent1 table1) ; Agent starts at table for initial interaction
        (atLocation bread1 table1)
        (atLocation bread2 table1)
        (atLocation tomato1 table1)
        (atLocation salt_shaker1 table1)
        (atLocation pepper_shaker1 table1)
        (atLocation paper_towel_roll1 table1)
        (atLocation egg1 table1)
        (atLocation egg2 table1)
        (atLocation spoon1 table1)
        (atLocation bottle1 table1)
        (atLocation mug1 table1)
        (atLocation mug2 table1)
        (atLocation cup1 table1)

        (atLocation knife1 countertop1)
        (atLocation toaster1 countertop1)
        (atLocation microwave1 countertop1) ; Microwave is mounted, so location is countertop
        (atLocation fridge1 countertop1) ; Fridge is adjacent, so location is countertop

        (inReceptacle bread1 table1)
        (inReceptacle bread2 table1)
        (inReceptacle tomato1 table1)
        (inReceptacle salt_shaker1 table1)
        (inReceptacle pepper_shaker1 table1)
        (inReceptacle paper_towel_roll1 table1)
        (inReceptacle egg1 table1)
        (inReceptacle egg2 table1)
        (inReceptacle spoon1 table1)
        (inReceptacle bottle1 table1)
        (inReceptacle mug1 table1)
        (inReceptacle mug2 table1)
        (inReceptacle cup1 table1)

        (inReceptacle knife1 countertop1)
        (inReceptacle toaster1 countertop1)
        (inReceptacle microwave1 countertop1)
        (inReceptacle fridge1 countertop1)
    )
    (:goal (and
        (inReceptacle bread1 microwave1)
        (isCool bread1)
        (isSliced bread1)
    ))
)