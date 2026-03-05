(define (problem move_toilet_paper)
    (:domain put_task)
    (:objects
        agent
        sink_with_faucet - sink
        toilet_paper_dispenser - receptacle
        toilet_paper_roll - object
        white_towel - object
        toothbrush - object
        plunger - object
        toilet_brush - object
    )
    (:init
        (openable toilet_paper_dispenser)
        (not (opened toilet_paper_dispenser))
        (inReceptacle toilet_paper_roll sink_with_faucet)
        (not (atLocation agent sink_with_faucet))
        (not (atLocation agent toilet_paper_dispenser))
        (not (holdsAny agent))
    )
    (:goal
        (and
            (inReceptacle toilet_paper_roll toilet_paper_dispenser)
        )
    )
)