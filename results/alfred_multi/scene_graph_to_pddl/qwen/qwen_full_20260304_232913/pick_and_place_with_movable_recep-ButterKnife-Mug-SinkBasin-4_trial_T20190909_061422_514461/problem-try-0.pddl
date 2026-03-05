(define (problem cleanup_knife_mug)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife
        mug
        table
        countertop
    )
    (:init
        (atLocation agent table)
        (inReceptacle knife table)
        (inReceptacle mug table)
        (openable microwave)
        (openable fridge)
        (openable sink)
        (not (opened microwave))
        (not (opened fridge))
        (not (opened sink))
        (not (holdsAny agent))
        (not (isClean knife))
        (not (isClean mug))
    )
    (:goal (and
        (isClean knife)
        (isClean mug)
        (inReceptacle knife sink)
        (inReceptacle mug sink)
    ))
)