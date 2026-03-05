(define (problem put_green_sponge_on_toilet_tank)
    (:domain put_task)
    (:objects
        robot - agent
        green_sponge - object
        toilet_tank - receptacle
    )
    (:init
        (not (atLocation robot toilet_tank))
        (not (holdsAny robot))
        (not (inReceptacle green_sponge toilet_tank))
    )
    (:goal
        (and
            (atLocation robot toilet_tank)
            (inReceptacle green_sponge toilet_tank)
        )
    )
)