(define (problem put_clean_egg_on_counter)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        sink - sink
        egg - object
        counter - receptacle
    )
    (:init
        (openable microwave)
        (inReceptacle egg microwave)
        (not (atLocation robot microwave))
        (not (atLocation robot sink))
        (not (atLocation robot counter))
        (not (isClean egg))
    )
    (:goal (and
        (atLocation robot counter)
        (inReceptacle egg counter)
        (isClean egg)
    ))
)