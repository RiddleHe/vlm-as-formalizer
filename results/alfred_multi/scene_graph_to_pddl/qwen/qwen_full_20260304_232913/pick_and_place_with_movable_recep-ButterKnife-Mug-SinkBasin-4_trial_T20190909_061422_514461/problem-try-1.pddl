(define (problem cleanup_knife_mug)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife
        gray_mug
        wooden_table
        countertop
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (inReceptacle knife wooden_table)
        (inReceptacle gray_mug wooden_table)
        (inReceptacle gray_mug countertop)
        (not (atLocation agent wooden_table))
        (not (atLocation agent countertop))
        (not (atLocation agent sink))
        (not (holdsAny agent))
        (not (isClean knife))
        (not (isClean gray_mug))
    )
    (:goal (and
        (isClean knife)
        (isClean gray_mug)
        (inReceptacle knife sink)
        (inReceptacle gray_mug sink)
    ))
)