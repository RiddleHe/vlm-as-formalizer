(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        ToiletPaper_2 - object
        ToiletPaper_1 - object
        ToiletPaperHanger_1 - receptacle
        Toilet_1 - receptacle
        GarbageCan_1 - receptacle
        )
    (:init
        (inReceptacle ToiletPaper_1 ToiletPaperHanger_1)
        (inReceptacle ToiletPaper_2 GarbageCan_1)
    )
    (:goal (and
        (inReceptacle ToiletPaper_1 Toilet_1)
        (inReceptacle ToiletPaper_1 Toilet_1)
    ))
)