(define (problem place_cooked_egg_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        table - receptacle
        sink - receptacle
        microwave - receptacle
        egg - object
        fork - object
        knife - object
        cup - object
        apple - object
        bowl - object
        coffee_machine - object
        green_object - object
        spatula - object
    )
    (:init
        (atLocation robot table)
        (inReceptacle egg sink)
        (inReceptacle cup sink)
        (inReceptacle fork sink)
        (inReceptacle green_object sink)
        (inReceptacle knife table)
        (inReceptacle apple table)
        (inReceptacle bowl table)
        (inReceptacle coffee_machine table)
        (inReceptacle spatula microwave)
        (openable microwave)
        (openable sink)
        (opened sink)
        (opened microwave)
    )
    (:goal
        (and
            (inReceptacle egg table)
            (isHot egg)
        )
    )
)