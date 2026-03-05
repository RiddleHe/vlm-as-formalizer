(define (problem cut_bread_and_fridge)
    (:domain put_task)
    (:objects
        robot - agent
        bread - object
        apple - object
        knife - knife
        fridge - fridge
        countertop - receptacle
        stove - receptacle
        toaster - receptacle
    )
    (:init
        (atLocation robot countertop)
        (inReceptacle bread countertop)
        (inReceptacle apple countertop)
        (inReceptacle knife countertop)
        (openable fridge)
        (not (opened fridge))
        (not (isSliced bread))
        (not (isCool bread))
    )
    (:goal
        (and
            (inReceptacle bread countertop)
            (isSliced bread)
            (isCool bread)
            (atLocation robot countertop)
        )
    )
)