(define (problem put_phone_on_bed)
    (:domain put_task)
    (:objects
        robot - agent
        phone - object
        bed - receptacle
        desk - object
        lamp - object
        pen - object
        chair - object
        trash_can - object
        laptop - object
        pillow - object
        blanket - object
    )
    (:init
        (atLocation robot desk)
        (inReceptacle phone desk)
        (openable bed)
        (not (opened bed))
        (not (holdsAny robot))
    )
    (:goal
        (inReceptacle phone bed)
    )
)