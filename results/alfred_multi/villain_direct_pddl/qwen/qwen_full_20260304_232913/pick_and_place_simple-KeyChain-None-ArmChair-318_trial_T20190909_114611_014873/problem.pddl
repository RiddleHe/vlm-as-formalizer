(define (problem move_keys_to_armchair)
    (:domain put_task)
    (:objects
        robot - agent
        desk - receptacle
        armchair - receptacle
        keys - object
    )
    (:init
        (openable desk)
        (opened desk)
        (inReceptacle keys desk)
        (atLocation robot desk)
    )
    (:goal
        (and
            (inReceptacle keys armchair)
            (not (inReceptacle keys desk))
        )
    )
)