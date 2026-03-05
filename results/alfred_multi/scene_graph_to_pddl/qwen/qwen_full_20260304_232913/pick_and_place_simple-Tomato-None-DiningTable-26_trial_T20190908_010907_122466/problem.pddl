(define (problem find_tomato_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        fridge - fridge
        microwave - microwave
        sink - sink
        table - receptacle
        tomato - object
        bread - object
        cup - object
        spatula - object
        knife - knife
    )
    (:init
        (openable fridge)
        (openable microwave)
        (openable sink)
        (opened fridge)
        (inReceptacle tomato fridge)
        (inReceptacle bread table)
        (inReceptacle cup table)
        (inReceptacle spatula table)
        (atLocation robot table)
    )
    (:goal
        (and
            (inReceptacle tomato table)
        )
    )
)