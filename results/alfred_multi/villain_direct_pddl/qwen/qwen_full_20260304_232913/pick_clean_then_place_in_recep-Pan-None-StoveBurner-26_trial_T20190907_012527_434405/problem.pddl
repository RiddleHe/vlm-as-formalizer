(define (problem rinse_pan)
    (:domain put_task)
    (:objects
        robot - agent
        pan - object
        stove - receptacle
        sink - sink
    )
    (:init
        (atLocation robot stove)
        (inReceptacle pan stove)
        (not (isClean pan))
    )
    (:goal (and (isClean pan)))
)