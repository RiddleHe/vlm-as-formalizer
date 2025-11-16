(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Bowl_1 - receptacle
        DishSponge_1 - object
        CounterTop_1 - receptacle
        Cabinet_1 - receptacle
        )
    (:init
        (inReceptacle DishSponge_1 CounterTop_1)
        (inReceptacle Bowl_1 CounterTop_1)
    )
    (:goal (and
        (inReceptacle DishSponge_1 Bowl_1)
        (inReceptacle Bowl_1 Cabinet_1)
    ))
)