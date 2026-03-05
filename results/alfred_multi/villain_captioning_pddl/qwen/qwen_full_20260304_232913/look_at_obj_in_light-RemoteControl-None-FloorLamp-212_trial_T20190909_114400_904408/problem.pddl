(define (problem turn_on_lamp_with_remote)
    (:domain put_task)
    (:objects
        agent1 - agent
        remote_control - object
        lamp - object
        couch - receptacle
    )
    (:init
        (atLocation agent1 couch) ; Agent starts at the couch where the remote is.
        (inReceptacle remote_control couch)
        (not (isOn lamp))
        (not (holdsAny agent1))
        (not (holds agent1 remote_control))
    )
    (:goal (and (isOn lamp) (isToggled lamp)))
)