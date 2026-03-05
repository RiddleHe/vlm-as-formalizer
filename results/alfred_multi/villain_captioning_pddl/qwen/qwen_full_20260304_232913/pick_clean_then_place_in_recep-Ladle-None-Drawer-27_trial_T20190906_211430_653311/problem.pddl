(define (problem clean_spoon)
    (:domain put_task)
    (:objects
        agent1 - agent
        sink1 - sink
        microwave1 - microwave
        cabinet1 - receptacle
        cabinet2 - receptacle
        knife1 - knife
        spoon1 - object
        table1 - object
    )
    (:init
        (not (atLocation agent1 sink1))
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 cabinet1))
        (not (atLocation agent1 cabinet2))
        (not (atLocation agent1 knife1))
        (not (atLocation agent1 spoon1))
        (not (atLocation agent1 table1))
        (openable cabinet1)
        (openable cabinet2)
        (not (opened cabinet1))
        (not (opened cabinet2))
        (not (isClean spoon1))
        (not (isHot spoon1))
        (not (isCool spoon1))
        (not (isOn microwave1))
        (not (isToggled microwave1))
        (not (isSliced spoon1))
        (not (holdsAny agent1))
        (not (holds agent1 spoon1))
        (not (holds agent1 knife1))
        (inReceptacle spoon1 table1)
        (inReceptacle knife1 table1)
    )
    (:goal (and
        (isClean spoon1)
        (inReceptacle spoon1 cabinet1)
    ))
)