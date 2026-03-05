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
        (atLocation robot bed)
        (inReceptacle cushion bed)
        (atLocation robot desk)
        (inReceptacle lamp desk)
        (not (isOn lamp))
    )
    (:goal (and
        (isOn lamp)
        (atLocation robot cushion)
    ))
)