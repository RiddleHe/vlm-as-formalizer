(define (problem put_rinsed_cloth_in_cabinet)
    (:domain put_task)
    (:objects
        agent - agent
        sink - sink
        cabinet - receptacle
        cloth - object
        soap - object
        blue_bin - receptacle
        spray_bottle - object
        candle - object
    )
    (:init
        (openable cabinet)
        (not (opened cabinet))
        (inReceptacle soap sink)
        (not (isClean cloth))
        (not (holdsAny agent))
        (not (atLocation agent sink))
        (not (atLocation agent cabinet))
        (not (atLocation agent cloth))
        (atLocation agent ?o) ; This is a placeholder; the agent is not at any specific location initially.
    )
    (:goal (and
        (inReceptacle cloth cabinet)
        (isClean cloth)
    ))
)