(define (problem put_candle_in_drawer)
    (:domain put_task)
    (:objects
        agent
        beige_sink - sink
        pink_soap_bar - object
        black_faucet - object
        green_countertop - object
        gray_tile_floor - object
        small_gold_candle - object
        black_pump_soap_dispenser - object
    )
    (:init
        (inReceptacle pink_soap_bar beige_sink)
        (atLocation agent green_countertop) ; assuming agent starts at countertop as default starting point
    )
    (:goal (and
        (inReceptacle small_gold_candle beige_sink) ; goal is to put candle in sink (as drawer is not present, sink is the only receptacle)
    ))
)