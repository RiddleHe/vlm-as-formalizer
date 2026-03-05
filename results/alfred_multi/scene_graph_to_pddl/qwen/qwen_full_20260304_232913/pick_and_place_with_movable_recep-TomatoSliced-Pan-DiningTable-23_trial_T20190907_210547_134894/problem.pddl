(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife_on_table
        knife_on_stove
        pan_on_stove
        bowl_on_table
        wine_bottle_1
        wine_bottle_2
        wine_bottle_3
        salt_shaker
        soap_dispenser
        tomato_1
        tomato_2
        lettuce_1
        lettuce_2
        martini_glass
        pot_on_stove
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (isOn pan_on_stove)
        (isOn pot_on_stove)
        (inReceptacle tomato_1 bowl_on_table)
        (inReceptacle tomato_2 bowl_on_table)
        (inReceptacle lettuce_1 bowl_on_table)
        (inReceptacle lettuce_2 bowl_on_table)
        (not (atLocation agent pan_on_stove))
        (not (atLocation agent bowl_on_table))
        (not (atLocation agent knife_on_table))
        (not (holdsAny agent))
    )
    (:goal
        (and
            (inReceptacle tomato_1 pan_on_stove)
            (isSliced tomato_1)
        )
    )
)