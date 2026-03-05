(define (problem put_task_lettuce)
    (:domain put_task)
    (:objects
        robot - agent
        sink - sink
        fridge - fridge
        cabinet - receptacle
        countertop - object
        table - object
        knife - knife
        lettuce - object
        egg - object
        potato - object
        bread - object
        tomato - object
        coffee_machine - object
    )
    (:init
        (openable sink)
        (openable fridge)
        (openable cabinet)
        (not (opened sink))
        (not (opened fridge))
        (not (opened cabinet))
        (inReceptacle potato sink)
        (inReceptacle egg sink)
        (atLocation knife table)
        (atLocation knife countertop)
        (atLocation lettuce table)
        (not (holdsAny robot))
        (not (isClean lettuce))
        (not (isSliced lettuce))
        (not (atLocation robot sink))
        (not (atLocation robot fridge))
        (not (atLocation robot cabinet))
        (not (atLocation robot countertop))
        (not (atLocation robot table))
        (not (atLocation robot knife))
        (not (atLocation robot lettuce))
        (not (atLocation robot egg))
        (not (atLocation robot potato))
        (not (atLocation robot bread))
        (not (atLocation robot tomato))
        (not (atLocation robot coffee_machine))
    )
    (:goal (and
        (atLocation robot countertop)
        (inReceptacle lettuce countertop)
        (isClean lettuce)
        (isSliced lettuce)
    ))
)