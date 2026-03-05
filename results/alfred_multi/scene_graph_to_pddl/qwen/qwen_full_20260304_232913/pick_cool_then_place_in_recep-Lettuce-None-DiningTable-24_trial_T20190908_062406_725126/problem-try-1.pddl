(define (problem place_chilled_lettuce)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        table - receptacle
        lettuce_left - object
        lettuce_right - object
        salt_shaker - object
        pepper_shaker - object
        green_book - object
        spoon - object
        wine_glass - object
        mug - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (openable sink)
        (atLocation agent table)
        (inReceptacle lettuce_left table)
        (inReceptacle lettuce_right table)
        (inReceptacle knife table)
        (inReceptacle salt_shaker table)
        (inReceptacle pepper_shaker table)
        (inReceptacle green_book table)
        (inReceptacle spoon table)
        (inReceptacle wine_glass table)
        (inReceptacle mug table)
        (not (holdsAny agent))
        (not (opened fridge))
        (not (opened microwave))
        (not (opened sink))
        (not (isCool lettuce_left))
        (not (isCool lettuce_right))
    )
    (:goal
        (and
            (inReceptacle lettuce_left table)
            (isCool lettuce_left)
        )
    )
)