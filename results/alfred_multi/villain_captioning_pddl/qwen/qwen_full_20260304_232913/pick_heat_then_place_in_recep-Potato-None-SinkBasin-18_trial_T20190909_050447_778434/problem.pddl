(define (problem put_heated_potato_in_sink)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        sink1 - sink
        potato1 - object
        egg1 - object
        lettuce1 - object
        knife1 - knife
    )
    (:init
        (openable microwave1)
        (not (opened microwave1))
        (openable sink1)
        (opened sink1) ; Sink is considered always open
        (inReceptacle potato1 sink1)
        (inReceptacle egg1 sink1)
        (inReceptacle lettuce1 sink1)
        (not (isHot potato1))
        (not (isSliced potato1))
        (not (isClean potato1))
        (not (holdsAny agent1))
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 sink1))
        (not (atLocation agent1 potato1))
        (not (atLocation agent1 egg1))
        (not (atLocation agent1 lettuce1))
        (not (atLocation agent1 knife1))
    )
    (:goal (and
        (inReceptacle potato1 sink1)
        (isHot potato1)
    ))
)