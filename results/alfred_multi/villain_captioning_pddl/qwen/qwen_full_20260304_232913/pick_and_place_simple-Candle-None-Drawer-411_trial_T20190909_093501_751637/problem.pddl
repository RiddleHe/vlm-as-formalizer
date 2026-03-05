(define (problem put_candle_in_drawer)
    (:domain put_task)
    (:objects
        agent1 - agent
        sink1 - sink
        soap_dispenser1 - object
        candle1 - object
        soap_bar1 - object
        faucet1 - object
        handle_left1 - object
        handle_right1 - object
    )
    (:init
        (atLocation agent1 sink1) ; assuming agent starts near sink for task initiation
        (inReceptacle soap_bar1 sink1)
        (not (holdsAny agent1))
        (not (isClean candle1))
        (not (isHot candle1))
        (not (isCool candle1))
        (not (isSliced candle1))
        (not (isToggled candle1))
        (not (opened sink1)) ; sink is not openable per domain, but initializing for completeness
        (not (openable sink1)) ; explicitly stating sink is not openable as per domain constraints
    )
    (:goal 
        (and 
            (inReceptacle candle1 sink1) ; since no drawer exists, using sink as fallback receptacle per domain
        )
    )
)