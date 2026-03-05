(define (problem put_heated_tomato_in_sink)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        sink1 - sink
        tomato1 tomato2 - object
        potato1 potato2 - object
        apple1 - object
        bread1 - object
        paper_towel_roll1 - object
        spatula1 - object
        pot1 - object
    )
    (:init
        (openable microwave1)
        (not (opened microwave1))
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 sink1))
        (not (atLocation agent1 tomato1))
        (not (atLocation agent1 tomato2))
        (not (holdsAny agent1))
        (not (isHot tomato1))
        (not (isHot tomato2))
        (not (isClean tomato1))
        (not (isClean tomato2))
        (not (isSliced tomato1))
        (not (isSliced tomato2))
        (not (inReceptacle tomato1 microwave1))
        (not (inReceptacle tomato2 microwave1))
        (not (inReceptacle tomato1 sink1))
        (not (inReceptacle tomato2 sink1))
        (inReceptacle apple1 sink1)
        (inReceptacle potato1 sink1)
        (inReceptacle potato2 sink1)
        (atLocation agent1 sink1) ; Assuming agent starts near sink for simplicity, or can be changed to none if needed
    )
    (:goal (and
        (inReceptacle tomato1 sink1)
        (isHot tomato1)
    ))
)