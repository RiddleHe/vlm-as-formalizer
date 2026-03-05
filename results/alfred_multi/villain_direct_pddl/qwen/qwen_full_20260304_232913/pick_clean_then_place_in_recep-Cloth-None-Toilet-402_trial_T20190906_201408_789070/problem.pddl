(define (problem put_cleaned_rag_on_toilet)
    (:domain put_task)
    (:objects
        robot - agent
        rag - object
        sink - sink
        toilet - receptacle
        candle - object
    )
    (:init
        (atLocation robot sink)
        (inReceptacle rag sink)
        (inReceptacle candle sink)
        (openable toilet)
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle rag toilet)
            (isClean rag)
        )
    )
)