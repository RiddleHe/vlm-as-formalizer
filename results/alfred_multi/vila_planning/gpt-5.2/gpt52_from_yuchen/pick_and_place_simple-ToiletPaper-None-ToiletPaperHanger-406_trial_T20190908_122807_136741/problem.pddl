(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ToiletPaper_1 - object
        CounterTop_1 - receptacle
        ToiletPaperHanger_1 - receptacle
        )
    (:init
        (inReceptacle ToiletPaper_1 CounterTop_1)
    )
    (:goal (and
        (inReceptacle ToiletPaper_1 ToiletPaperHanger_1)
    ))
)