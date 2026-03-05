(define (problem put_clean_fork_in_drawer)
    (:domain put_task)
    (:objects
        robot - agent
        fork - object
        sink - sink
        drawer - receptacle
    )
    (:init
        (atLocation robot sink)  ; assuming robot starts near sink for cleaning
        (inReceptacle fork sink)  ; fork is initially in sink (to be cleaned)
        (openable drawer)
        (not (opened drawer))
        (not (isClean fork))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle fork drawer)
            (isClean fork)
            (opened drawer)  ; drawer must be opened to put fork in
        )
    )
)