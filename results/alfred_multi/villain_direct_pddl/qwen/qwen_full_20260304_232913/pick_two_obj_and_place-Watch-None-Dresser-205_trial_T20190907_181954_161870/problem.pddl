(define (problem put_watches_on_tv_stand)
    (:domain put_task)
    (:objects
        agent1 - agent
        watch1 watch2 - object
        tv_stand - receptacle
        tv - object
    )
    (:init
        (atLocation agent1 watch1)
        (atLocation agent1 watch2)
        (atLocation agent1 tv_stand)
        (atLocation agent1 tv)
        (not (holdsAny agent1))
        (not (opened tv_stand))
        (not (isOn tv))
        (not (isToggled tv))
    )
    (:goal
        (and
            (inReceptacle watch1 tv_stand)
            (inReceptacle watch2 tv_stand)
        )
    )
)