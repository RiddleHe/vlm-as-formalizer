(define (problem put_cold_brown_ball_in_sink)
    (:domain put_task)
    (:objects
        robot - agent
        fridge - fridge
        sink - sink
        brown_ball - object
        recycling_bin - receptacle
        knife - knife
    )
    (:init
        (openable fridge)
        (not (opened fridge))
        (inReceptacle brown_ball recycling_bin)
        (not (isCool brown_ball))
        (not (isClean brown_ball))
        (not (holdsAny robot))
        (not (atLocation robot fridge))
        (not (atLocation robot sink))
        (not (atLocation robot recycling_bin))
    )
    (:goal
        (and
            (inReceptacle brown_ball sink)
            (isCool brown_ball)
        )
    )
)