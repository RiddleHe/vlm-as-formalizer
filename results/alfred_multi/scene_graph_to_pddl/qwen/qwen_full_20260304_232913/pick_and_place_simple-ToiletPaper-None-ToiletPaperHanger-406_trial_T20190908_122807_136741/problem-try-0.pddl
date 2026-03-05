(define (problem move_toilet_paper)
    (:domain put_task)
    (:objects
        agent - agent
        sink - sink
        toilet - receptacle
        toilet_paper_roll - object
        toilet_paper_dispenser - object
    )
    (:init
        (atLocation agent sink)
        (inReceptacle toilet_paper_roll sink)
    )
    (:goal (and
        (inReceptacle toilet_paper_roll toilet_paper_dispenser)
    ))
)