(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        HandTowel_2 - object
        HandTowel_1 - object
        BathtubBasin_1 - receptacle
        HandTowelHolder_2 - receptacle
        HandTowelHolder_1 - receptacle
        )
    (:init
        (inReceptacle HandTowel_2 HandTowelHolder_2)
        (inReceptacle HandTowel_1 HandTowelHolder_1)
    )
    (:goal (and
        (inReceptacle HandTowel_1 BathtubBasin_1)
        (inReceptacle HandTowel_1 BathtubBasin_1)
    ))
)