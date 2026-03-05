(define (problem chill_lettuce)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife
        table
        lettuce_left
        lettuce_right
        salt_shaker
        pepper_shaker
        green_book
        spoon
        wine_glass
        mug
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
        (not (opened fridge))
        (not (opened microwave))
        (not (opened sink))
        (not (holdsAny agent))
        (not (isCool lettuce_left))
        (not (isCool lettuce_right))
    )
    (:goal
        (and
            (isCool lettuce_left)
            (inReceptacle lettuce_left table)
        )
    )
)