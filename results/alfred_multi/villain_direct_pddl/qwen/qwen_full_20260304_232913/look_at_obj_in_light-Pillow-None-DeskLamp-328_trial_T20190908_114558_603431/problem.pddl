(define (problem look_at_cushion_by_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        cushion - object
        lamp - object
        bed - receptacle
        desk - receptacle
    )
    (:init
        (atLocation robot desk)
        (inReceptacle cushion bed)
        (inReceptacle lamp desk)
        (openable bed)
        (openable desk)
        (opened bed)
        (opened desk)
    )
    (:goal
        (and
            (atLocation robot cushion)
            (isOn lamp)
        )
    )
)