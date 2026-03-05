(define (problem put_spray_bottle_in_cabinet)
    (:domain put_task)
    (:objects
        agent
        sink1 - sink
        sink2 - sink
        cabinet - receptacle
        trash_bin - receptacle
        toilet_tank - receptacle
        spray_bottle - object
        toilet_paper - object
    )
    (:init
        (openable cabinet)
        (openable trash_bin)
        (openable toilet_tank)
        (not (opened cabinet))
        (not (opened trash_bin))
        (not (opened toilet_tank))
        (inReceptacle spray_bottle toilet_tank)
        (inReceptacle toilet_paper toilet_paper_holder)
        (isOn spray_bottle)
        (not (holdsAny agent))
        (not (atLocation agent spray_bottle))
        (not (atLocation agent cabinet))
        (not (atLocation agent toilet_tank))
    )
    (:goal
        (and
            (inReceptacle spray_bottle cabinet)
        )
    )
)