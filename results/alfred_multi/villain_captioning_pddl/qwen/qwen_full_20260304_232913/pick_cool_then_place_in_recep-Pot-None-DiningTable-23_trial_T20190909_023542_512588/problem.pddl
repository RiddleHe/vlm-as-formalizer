(define (problem put_chilled_bowl_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        fridge1 - fridge
        table1 - receptacle
        shelf_under_table1 - receptacle
        bowl1 - object
        cabbage1 - object
        potato1 - object
        pan1 - object
        pot1 - object
        pot2 - object
        cup1 - object
        cup2 - object
    )
    (:init
        (openable fridge1)
        (not (opened fridge1))
        (inReceptacle bowl1 shelf_under_table1)
        (inReceptacle cup1 shelf_under_table1)
        (inReceptacle cup2 shelf_under_table1)
        (atLocation agent1 table1) ; Assuming agent starts near table for practicality, though caption says not at any location. We must pick a starting point for planning.
        (not (holdsAny agent1))
        (not (isCool bowl1))
        (not (isHot bowl1))
        (not (isClean bowl1))
        (not (isSliced bowl1))
        (not (isOn fridge1))
        (not (isToggled fridge1))
    )
    (:goal (and
        (inReceptacle bowl1 table1)
        (isCool bowl1)
    ))
)