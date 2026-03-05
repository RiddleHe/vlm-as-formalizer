(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        bread1 bread2 - object
        knife - knife
        microwave - microwave
        fridge - fridge
        sink - sink
        table - receptacle
        countertop - receptacle
        toaster - object
        tomato - object
        saltshaker - object
        pepper - object
        egg - object
        cup - object
        bottle - object
        sponge - object
        paperroll - object
    )
    (:init
        (atLocation robot table)
        (inReceptacle bread1 table)
        (inReceptacle bread2 table)
        (inReceptacle knife countertop)
        (inReceptacle tomato countertop)
        (inReceptacle saltshaker countertop)
        (inReceptacle pepper countertop)
        (inReceptacle egg table)
        (inReceptacle cup table)
        (inReceptacle bottle table)
        (inReceptacle sponge table)
        (inReceptacle paperroll table)
        (openable fridge)
        (openable microwave)
        (not (opened fridge))
        (not (opened microwave))
        (not (isSliced bread1))
        (not (isSliced bread2))
        (not (isCool bread1))
        (not (isCool bread2))
        (not (isHot bread1))
        (not (isHot bread2))
        (not (isClean bread1))
        (not (isClean bread2))
        (not (isOn microwave))
        (not (isOn fridge))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle bread1 microwave)
            (isCool bread1)
            (isSliced bread1)
        )
    )
)