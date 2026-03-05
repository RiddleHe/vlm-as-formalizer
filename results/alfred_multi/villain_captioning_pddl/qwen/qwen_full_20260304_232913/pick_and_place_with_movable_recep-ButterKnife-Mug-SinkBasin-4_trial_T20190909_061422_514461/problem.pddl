(define (problem cleanup_knife_mug)
    (:domain put_task)
    (:objects
        robot - agent
        knife - object
        mug - object
        sink - sink
        table - object  ; The table is treated as a location, not a receptacle in this domain
    )
    (:init
        (atLocation robot table)  ; Robot starts at the table where knife and mug are located
        (not (holdsAny robot))
        (not (isClean knife))
        (not (isClean mug))
        (not (inReceptacle knife sink))
        (not (inReceptacle mug sink))
        (openable sink)  ; Sink is openable per domain, though typically always accessible
        (not (opened sink))  ; Not opened initially (though for sink, this may be irrelevant)
    )
    (:goal (and
        (inReceptacle knife sink)
        (inReceptacle mug sink)
        (isClean knife)
        (isClean mug)
    ))
)