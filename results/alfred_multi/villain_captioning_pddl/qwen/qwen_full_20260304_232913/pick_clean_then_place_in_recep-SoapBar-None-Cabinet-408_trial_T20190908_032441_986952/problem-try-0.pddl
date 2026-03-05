(define (problem put_wet_soap_in_cabinet)
    (:domain put_task)
    (:objects
        agent1 - agent
        cabinet - receptacle
        sink - receptacle
        bar_of_soap - object
        faucet1 faucet2 - object
        toilet mirror candlestick toilet_paper - object
    )
    (:init
        (openable cabinet)
        (not (opened cabinet))
        (atLocation agent1 cabinet)
        (atLocation agent1 sink)
        (atLocation agent1 bar_of_soap)
        (not (holdsAny agent1))
        (not (isClean bar_of_soap))
    )
    (:goal (and
        (inReceptacle bar_of_soap cabinet)
        (isClean bar_of_soap)
    ))
)