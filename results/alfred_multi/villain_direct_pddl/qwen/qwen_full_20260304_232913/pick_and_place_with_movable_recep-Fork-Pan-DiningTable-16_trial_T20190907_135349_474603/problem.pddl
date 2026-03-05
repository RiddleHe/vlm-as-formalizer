(define (problem put_frying_pan_with_fork_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        round_table - receptacle
        frying_pan - object
        fork - object
    )
    (:init
        (atLocation agent1 frying_pan)
        (atLocation agent1 fork)
        (not (holdsAny agent1))
    )
    (:goal
        (and
            (inReceptacle fork frying_pan)
            (inReceptacle frying_pan round_table)
        )
    )
)