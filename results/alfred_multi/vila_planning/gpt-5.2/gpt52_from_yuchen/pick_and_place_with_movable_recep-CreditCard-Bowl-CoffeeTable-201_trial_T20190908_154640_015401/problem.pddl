(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Bowl_1 - receptacle
        CreditCard_1 - object
        CoffeeTable_1 - receptacle
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Bowl_1 DiningTable_1)
        (inReceptacle CreditCard_1 CoffeeTable_1)
    )
    (:goal (and
        (inReceptacle CreditCard_1 Bowl_1)
        (inReceptacle Bowl_1 CoffeeTable_1)
    ))
)