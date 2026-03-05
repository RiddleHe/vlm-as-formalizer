(define (problem put_washed_slice_in_microwave)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        sink1 - sink
        table1 - object
        potato1 - object
        knife1 - knife
        fork1 - object
        spoon1 - object
        spatula1 - object
        bowl1 - object
        metal_cup1 - object
        salt_shaker1 - object
        kettle1 - object
        black_mug1 - object
        red_apple1 - object
    )
    (:init
        (atLocation agent1 table1)
        (inReceptacle potato1 table1)
        (inReceptacle knife1 microwave1) ; corrected based on image: knife is on countertop near microwave
        (inReceptacle fork1 sink1)
        (inReceptacle black_mug1 sink1)
        (inReceptacle red_apple1 sink1)
        (openable microwave1)
        (not (opened microwave1))
        (not (isClean potato1))
        (not (isSliced potato1))
        (not (isHot potato1))
        (not (holdsAny agent1))
        (not (isOn microwave1))
        (not (isToggled microwave1))
    )
    (:goal (and
        (inReceptacle potato1 microwave1)
        (isClean potato1)
        (isSliced potato1)
    ))
)