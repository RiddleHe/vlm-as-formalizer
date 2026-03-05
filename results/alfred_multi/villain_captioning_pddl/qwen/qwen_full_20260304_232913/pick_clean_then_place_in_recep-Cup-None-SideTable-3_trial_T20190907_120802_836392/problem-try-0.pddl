(define (problem clean_mug_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        mug - object
        sink - sink
        countertop - receptacle
        microwave - microwave
        fridge - fridge
        knife - knife
        toaster - object
        green_glass - object
        bread1 bread2 - object
        pot - object
        plant - object
        pepper_grinder - object
        sponge - object
        spoon - object
    )
    (:init
        (atLocation robot countertop) ; assuming robot starts at countertop for simplicity, or can be any location not specified
        (not (atLocation robot mug))
        (not (atLocation robot sink))
        (not (atLocation robot microwave))
        (not (atLocation robot fridge))
        (not (atLocation robot knife))
        (not (atLocation robot toaster))
        (not (atLocation robot green_glass))
        (not (atLocation robot bread1))
        (not (atLocation robot bread2))
        (not (atLocation robot pot))
        (not (atLocation robot plant))
        (not (atLocation robot pepper_grinder))
        (not (atLocation robot sponge))
        (not (atLocation robot spoon))

        (inReceptacle knife sink)
        (inReceptacle sponge sink)
        (inReceptacle spoon sink)

        (atLocation mug countertop) ; mug is on the black cabinet next to microwave, which is on countertop
        (atLocation microwave countertop)
        (atLocation pepper_grinder countertop)
        (atLocation toaster countertop)
        (atLocation green_glass countertop)
        (atLocation bread1 countertop)
        (atLocation bread2 countertop)
        (atLocation pot countertop)
        (atLocation plant countertop)

        (openable sink)
        (openable microwave)
        (openable fridge)

        (not (isClean mug))
        (not (holdsAny robot))
        (not (holds robot mug))
        (not (opened microwave))
        (not (opened fridge))
        (not (isOn microwave))
        (not (isOn fridge))
        (not (isHot mug))
        (not (isCool mug))
        (not (isSliced mug))
    )
    (:goal (and
        (inReceptacle mug countertop)
        (isClean mug)
    ))
)