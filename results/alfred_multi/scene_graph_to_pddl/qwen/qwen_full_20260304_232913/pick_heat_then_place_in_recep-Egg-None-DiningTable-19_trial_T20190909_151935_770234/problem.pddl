(define (problem place_cooked_egg_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        sink - sink
        table - receptacle
        knife - knife
        egg - object
        mug - object
        fork - object
        book - object
        bowl - object
        apple - object
        coffee_maker - object
    )
    (:init
        (openable microwave)
        (openable sink)
        (isOn microwave)
        (isOn coffee_maker)
        (inReceptacle mug sink)
        (inReceptacle egg sink)
        (inReceptacle fork sink)
        (inReceptacle book sink)
        (inReceptacle mug coffee_maker)
        (inReceptacle bowl table)
        (inReceptacle apple table)
        (inReceptacle book table)
        (inReceptacle knife table)
        (inReceptacle fork table)
        (atLocation robot sink) ; assuming robot starts near sink as egg is there
    )
    (:goal
        (and
            (inReceptacle egg table)
            (isHot egg)
        )
    )
)