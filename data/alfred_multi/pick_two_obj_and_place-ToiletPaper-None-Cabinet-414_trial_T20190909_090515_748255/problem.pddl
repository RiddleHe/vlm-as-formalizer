(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ToiletPaper_1 - object
        ToiletPaper_2 - object
        CounterTop_1 - receptacle
        Cabinet_1 - receptacle
        GarbageCan_1 - receptacle
        )
    (:init
        (inReceptacle ToiletPaper_2 CounterTop_1)
        (inReceptacle ToiletPaper_1 GarbageCan_1)
    )
    (:goal (and
        (inReceptacle ToiletPaper_1 Cabinet_1)
        (inReceptacle ToiletPaper_1 Cabinet_1)
    ))
)