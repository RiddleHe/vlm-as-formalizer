(define (problem turn_on_lamp_with_remote)
    (:domain put_task)
    (:objects
        robot - agent
        lamp - object
        remote - object
        couch - receptacle
    )
    (:init
        (atLocation robot couch)
        (inReceptacle remote couch)
        (not (isOn lamp))
    )
    (:goal (isOn lamp))
)