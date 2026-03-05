(define (problem find_tomato_put_table)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        table - receptacle
        tomato - object
        bread - object
        cup - object
        spatula - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (openable sink)
        (inReceptacle tomato table)
        (inReceptacle bread table)
        (inReceptacle cup table)
        (inReceptacle spatula table)
    )
    (:goal (and (inReceptacle tomato table)))
)