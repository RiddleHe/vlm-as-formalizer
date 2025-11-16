(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        CreditCard_1 - object
        FloorLamp_1 - object
        CoffeeTable_1 - receptacle
        )
    (:init
        (inReceptacle CreditCard_1 CoffeeTable_1)
    )
    (:goal (and
        (isToggled FloorLamp_1)
        (atLocation agent1 FloorLamp_1)
        (holds agent1 CreditCard_1)
    ))
)