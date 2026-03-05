(define (problem put_candle_in_drawer)
    (:domain put_task)
    (:objects
        agent
        beige_sink - sink
        green_countertop - receptacle
        white_cabinet_under_sink - receptacle
        small_pink_candle - object
        black_soap_dispenser - object
        pink_bar_of_soap - object
    )
    (:init
        (openable beige_sink)
        (openable white_cabinet_under_sink)
        (inReceptacle pink_bar_of_soap beige_sink)
        (inReceptacle small_pink_candle green_countertop)
        (inReceptacle black_soap_dispenser green_countertop)
    )
    (:goal
        (inReceptacle small_pink_candle white_cabinet_under_sink)
    )
)