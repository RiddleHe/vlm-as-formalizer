(define (problem put_cleaned_rag_on_toilet_tank_lid)
    (:domain put_task)
    (:objects
        robot - agent
        left_sink - sink
        right_sink - sink
        toilet_tank_lid - receptacle
        purple_rag - object
        yellow_candle - object
    )
    (:init
        (openable left_sink)
        (openable right_sink)
        (inReceptacle purple_rag left_sink)
        (inReceptacle yellow_candle left_sink)
        (atLocation robot left_sink)  ; assuming robot starts near left sink for efficiency
    )
    (:goal (and
        (inReceptacle purple_rag toilet_tank_lid)
        (isClean purple_rag)
    ))
)