(define (problem put_toilet_paper_on_toilet)
    (:domain put_task)
    (:objects
        robot - agent
        toilet - receptacle
        toilet_paper_roll_full - object
        toilet_paper_roll_empty - object
        trash_can - receptacle
    )
    (:init
        (atLocation robot trash_can)
        (inReceptacle toilet_paper_roll_full trash_can)
        (inReceptacle toilet_paper_roll_empty trash_can)
        (openable trash_can)
        (opened trash_can)
    )
    (:goal
        (and
            (inReceptacle toilet_paper_roll_full toilet)
            (inReceptacle toilet_paper_roll_empty toilet)
        )
    )
)