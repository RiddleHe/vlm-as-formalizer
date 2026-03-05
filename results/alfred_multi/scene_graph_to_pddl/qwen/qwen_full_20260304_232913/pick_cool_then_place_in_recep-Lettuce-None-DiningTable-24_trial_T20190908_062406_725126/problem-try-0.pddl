(define (problem chill_lettuce)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife
        table
        head_of_lettuce_left
        head_of_lettuce_right
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
        (opened fridge)
        (inReceptacle head_of_lettuce_left table)
        (inReceptacle head_of_lettuce_right table)
        (inReceptacle salt_shaker table)
        (inReceptacle pepper_shaker table)
        (inReceptacle green_book table)
        (inReceptacle spoon table)
        (inReceptacle wine_glass table)
        (inReceptacle mug table)
        (inReceptacle knife table)
        (atLocation agent table)  ; assuming agent starts near table for simplicity
    )
    (:goal
        (and
            (isCool head_of_lettuce_left)
            (inReceptacle head_of_lettuce_left table)
        )
    )
)