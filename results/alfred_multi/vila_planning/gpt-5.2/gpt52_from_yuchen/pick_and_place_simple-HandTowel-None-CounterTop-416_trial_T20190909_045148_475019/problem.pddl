(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        HandTowel_1 - object
        HandTowelHolder_1 - receptacle
        CounterTop_1 - receptacle
        )
    (:init
        (inReceptacle HandTowel_1 HandTowelHolder_1)
    )
    (:goal (and
        (inReceptacle HandTowel_1 CounterTop_1)
    ))
)