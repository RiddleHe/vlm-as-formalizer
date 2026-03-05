(define (problem move_toilet_paper)
    (:domain put_task)
    (:objects
        agent
        bathroom_sink - receptacle
        toilet - receptacle
        toilet_paper_dispenser - receptacle
        toilet_paper_roll - object
        white_towel - object
        green_toothbrush - object
        brown_toothbrush - object
        toilet_brush - object
        plunger - object
    )
    (:init
        (openable toilet)
        (inReceptacle white_towel bathroom_sink)
        (inReceptacle green_toothbrush bathroom_sink)
        (inReceptacle brown_toothbrush bathroom_sink)
        (inReceptacle toilet_brush toilet)
        (inReceptacle plunger toilet)
        (inReceptacle toilet_paper_roll bathroom_sink)
    )
    (:goal (and
        (inReceptacle toilet_paper_roll toilet_paper_dispenser)
    ))
)