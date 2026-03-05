(define (problem place_pans_on_counter)
    (:domain put_task)
    (:objects
        agent1 - agent
        pan1 pan2 - object
        bowl - object
        microwave - receptacle
        stove - object
        counter - receptacle
    )
    (:init
        (atLocation agent1 stove)
        (inReceptacle pan1 stove)
        (inReceptacle pan2 stove)
        (inReceptacle bowl stove)
        (openable microwave)
        (not (opened microwave))
        (not (holdsAny agent1))
        (not (isClean pan1))
        (not (isClean pan2))
        (not (isHot pan1))
        (not (isHot pan2))
        (not (isCool pan1))
        (not (isCool pan2))
        (not (isSliced pan1))
        (not (isSliced pan2))
        (not (isOn stove))
        (not (isToggled stove))
    )
    (:goal (and
        (inReceptacle pan1 counter)
        (inReceptacle pan2 counter)
    ))
)