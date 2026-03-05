(define (problem place_watches_on_tv_stand)
    (:domain put_task)
    (:objects
        agent1 - agent
        tv_stand - receptacle
        dining_table - receptacle
        watch1 watch2 - object
    )
    (:init
        (atLocation agent1 dining_table)
        (inReceptacle watch1 dining_table)
        (inReceptacle watch2 dining_table)
        (openable tv_stand)
        (openable dining_table)
        (opened dining_table)
        (not (holdsAny agent1))
    )
    (:goal (and
        (inReceptacle watch1 tv_stand)
        (inReceptacle watch2 tv_stand)
    ))
)