(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        table - receptacle
        sink - receptacle
        microwave - receptacle
        egg - object
        knife - object
        fork - object
        apple - object
        cup - object
        bowl - object
        coffee_maker - object
        soap_bottle - object
        green_book - object
        spatula - object
    )
    (:init
        (atLocation robot table)
        (inReceptacle egg sink)
        (inReceptacle cup sink)
        (inReceptacle fork sink)
        (inReceptacle green_book sink)
        (inReceptacle apple table)
        (inReceptacle knife table)
        (inReceptacle bowl table)
        (inReceptacle coffee_maker table)
        (inReceptacle soap_bottle table)
        (inReceptacle spatula table)
        (openable microwave)
        (openable sink)
        (isOn coffee_maker)
        (isToggled coffee_maker)
    )
    (:goal (and
        (inReceptacle egg table)
        (isHot egg)
    ))
)