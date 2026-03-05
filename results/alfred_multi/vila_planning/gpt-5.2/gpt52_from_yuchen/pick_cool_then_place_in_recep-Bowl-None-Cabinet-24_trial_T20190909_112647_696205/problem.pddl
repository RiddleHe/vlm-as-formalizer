(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Bowl_1 - object
        Cabinet_2 - receptacle
        Cabinet_1 - receptacle
        Fridge_1 - fridge
        )
    (:init
        (inReceptacle Bowl_1 Cabinet_1)
    )
    (:goal (and
        (isCool Bowl_1)
        (inReceptacle Bowl_1 Cabinet_1)
    ))
)