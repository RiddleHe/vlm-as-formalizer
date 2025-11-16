(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        Pan_1 - receptacle
        Fork_1 - object
        CounterTop_1 - receptacle
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle Pan_1 CounterTop_1)
        (inReceptacle Fork_1 DiningTable_1)
    )
    (:goal (and
        (inReceptacle Fork_1 Pan_1)
        (inReceptacle Pan_1 DiningTable_1)
    ))
)