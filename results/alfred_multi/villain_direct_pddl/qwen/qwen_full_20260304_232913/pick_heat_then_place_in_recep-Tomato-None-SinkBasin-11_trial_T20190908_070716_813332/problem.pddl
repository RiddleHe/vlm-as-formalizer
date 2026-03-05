(define (problem put_heated_tomato_in_sink)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        sink1 - sink
        tomato1 tomato2 - object
        stove1 - object
        bread1 - object
        paper_towel1 - object
        spatula1 - object
        pot1 - object
    )
    (:init
        (atLocation agent1 stove1)
        (openable microwave1)
        (not (opened microwave1))
        (not (isHot tomato1))
        (not (isHot tomato2))
        (not (isClean tomato1))
        (not (isClean tomato2))
        (not (isSliced tomato1))
        (not (isSliced tomato2))
        (not (isOn microwave1))
        (not (isToggled microwave1))
        (not (holdsAny agent1))
        (not (holds agent1 tomato1))
        (not (holds agent1 tomato2))
        (not (inReceptacle tomato1 microwave1))
        (not (inReceptacle tomato2 microwave1))
        (not (inReceptacle tomato1 sink1))
        (not (inReceptacle tomato2 sink1))
    )
    (:goal (and
        (inReceptacle tomato1 sink1)
        (isHot tomato1)
    ))
)